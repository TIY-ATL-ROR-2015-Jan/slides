## Final Projects, Mea Culpa

* Two words: "Science Fair"
* Three more words: "Everyone gets seen"










## Quiz Time!

1. What is the difference between absolute
   and relative URLs?

2. Which kind does user_path generate?













## And Now For Something Completely Different ...

### DarkRoku!

A quirky, private (but probably insecure) file-sharing service!





## A Quick Spec

(Today's target)
* Users can sign up and login.
* Users can upload files.
* Users have avatars via paperclip!

(Tomorrow's target)
* Users can ask other users to view their files.
* If access is granted, they can download each other's files.
* Also, notifications are sent by email so you know about invites/grants.
* Hopefully do direct uploads to ease Rails life/see more JS things.

## Walkthrough

### Some Boring Setup Things

* Users can sign up and login.
  * Done in 15 minutes with Devise of course. Added usernames too.
  * Ran `rails g devise:views` so we can customize various things.
  * I thought about switching it to allow login
    by username instead of email. But meh, [too much typing][devise-fail].












* Heroku things, use postgres locally *and* in production! :)
  * You did `brew install postgres` at some point, right?
  * Run `ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents`.
    Now postgres will start on every reboot. You have a "real" database!
    Run `launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist`
    to go ahead and start the database now. :)
  * You can create databases like `createdb darkroku-dev`.
    Access SQL command prompt with `psql -h localhost -d darkroku-dev`.
  * Teach rails to use it [like so][postgres-commit].

* We'll even switch to [Puma][puma] since Heroku [likes it][heroku-web].
  * Puma is a faster webserver than the default (webrick).
  * The big switch here isn't the Gem, it's using a `Procfile`
    to manage running our rails app.
  * We also install a gem (not with bundle!) called [`foreman`][foreman]
    to use the procfile and set up environment variables as
    needed based on a `.env` file in our project directory.
    This will be nice when we start adding S3 Buckets or API keys.

[devise-fail]: https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address
[foreman]: http://blog.daviddollar.org/2011/05/06/introducing-foreman.html
[postgres-commit]: https://github.com/TIY-ATL-ROR-2015-Jan/darkroku/commit/9c8e336967ecc958565f906e74bf8df7fce3cbd7
[heroku-web]: https://devcenter.heroku.com/articles/getting-started-with-rails4#webserver
[puma]: http://puma.io/

### And More Interesting Functionality ...

* Users can upload files.

### Now Avatar!

* Users have avatars via paperclip!
  * Maybe tagline/bio/bday/homepage/twitter/location? *sigh*
    (We could just call this a *profile*.)

1. Install imagemagick with brew so paperclip can resize things.
   (heroku already has imagemagick installed)
2. Add [paperclip][paperclip] gem.
3. Add a Profile model, user `has_one :profile`, profile `belongs_to :user`.
   See [Choosing between belongs_to and has_one][choosing] and
   [Differences between belongs_to and has_one][differences].
4. Add forms, views, talk about image_tag a bit perhaps.
   Don't forget to talk about `:multipart => true`.

[choosing]: http://guides.rubyonrails.org/association_basics.html#choosing-between-belongs-to-and-has-one
[differences]: http://requiremind.com/differences-between-has-one-and-belongs-to-in-ruby-on-rails/

[heroku-paperclip]: https://devcenter.heroku.com/articles/paperclip-s3
[paperclip]: https://github.com/thoughtbot/paperclip

### Oh nooooes! We need a new storage adapter!

This works fine for local, but sucks on Heroku.
Files aren't accessible across multiple servers/dynos!

We'll store them on S3! Three good reasons:
  1. S3 is faster than Rails at serving static assets (i.e. images, files).
  2. Heroku is "horizontally scalable". I.e. Just run more servers to
     meet demand. But this means you can't store the files on the filesystem
     because the other servers wouldn't be able to get to them. The database
     is actually hosted on another machine in production anyway, so no
     problem there.
  3. It's really cheap and durable. :D

Heroku has a nice writeup with more about getting started
with S3 [here][heroku-s3].

[heroku-s3]: https://devcenter.heroku.com/articles/s3

### S3 has a [Free Tier][free-s3]. So ... Good News.

Sign up! Cancel it anytime you want.

* You'll get an Access Key and Secret Key, like most APIs.
* Files are stored in "buckets".
* S3 isn't *actually* a file system. There are no folders.
* We "fake" folders by having files with slashes in the name. S3 don't care.
* Files can be privately or publicly available.
  You can also generate temporary public links, etc.

**Don't forget to create a bucket!**

[free-s3]: https://aws.amazon.com/free/

### Now add a Ruby S3 Library

1. Add the `aws-sdk` gem to the gemfile to interact with S3
   and other Amazon Web Services.
2. Add `S3_BUCKET`, `AWS_ACCESS_KEY`, and `AWS_SECRET_ACCESS_KEY` to `.env`.
3. Add an initializer to setup the AWS gem based on those values.
4. Mirror the changes to `.env` on heroku via `heroku config:set FOO=bar`.
5. Add some paperclip settings to `config/environments/production.rb`
   as seen in [le Heroku guide][heroku-paper-config].
6. You should probably mirror them locally in
   `config/environments/development.rb`
   so we can test without deploying to Heroku. :)

We're done!

[heroku-paper-config]: https://devcenter.heroku.com/articles/paperclip-s3#configuration

## Tomorrow

Invites, downloading files from S3, and mailers!

## Questions?

*cough*
