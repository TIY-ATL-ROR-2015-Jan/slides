## Getting Ready for Cross-Class Project

Ya'll are gonna work in teams of 9
(~4 backend, 2 frontend, ~3 mobile) to
write checkers apps!

Each team of ~9 will:

* Form a github organization
* Create 3 repos (for backend, frontend, mobile)
* Will be assigned Tuesday night and you will
  have until Monday morning to complete it!

## Two things we still need ...

Things we'll work on today:

* Token Authentication
* Deploying to Heroku

## Why Token Auth?

* Devise login sets a cookie to store session info
* Great for browser but PITA for frontend / mobile
* Instead, have ways for them to sign up, get API
  token automatically, can use it to make
  authenticated requests via JSON API

## Token Auth Cliffnotes

* There used to be a `TokenAuthenticatable` module
  in Devise but they ripped it out. Bad info online.
* There are `devise_token_auth` and
  `simple_token_authentication` gems but they're
  magical, not as simple as you'd think, etc
* Anyway, we're just gonna roll our own system by hand.
  It's not too bad. Have [a look][handrolled] ...

[handrolled]: https://gist.github.com/josevalim/fb706b1e933ef01e4fb6

## The Joys (or not) of Handrolled Software

* This does require us to subclass the Devise::RegistrationsController.
  And specify that it should use *our* registrations controller in `routes.rb`.
  We do this since devise's default controller doesn't respond to JSON well
  and as an API server that's basically all we want it to do.

* And adjust the Rails [CSRF][csrf] (cross site request forgery)
  protection so that it doesn't get mad we send POST requests with
  no `authenticity_token`. So use `protect_from_forgery with: :null_session`
  in `ApplicationController`.

* And add our own `authenticate_via_user_token!` method to the
  ApplicationController. *sigh* That method should probably
  render a json "Unauthenticated" response if login via token
  is unsuccessful.

[csrf]: http://en.wikipedia.org/wiki/Cross-site_request_forgery
[sta]: https://github.com/gonzalo-bulnes/simple_token_authentication

## And yet we're still not done

* Also, we'll add override the sessions controller so you can
  request the auth token via username and password.

* Now let's give them something to authenticate for!
  (Add basic game model, tic tac toe-ish.)

* Finally, it's very important we enable [CORS][cors].
  CORS (cross origin request sharing) enables frontend
  to write a javascript client hosted anywhere that can
  make requests to our backend.
  There are some notes on this in [devise_token_auth readme][devise-token-cors].
  There is also a decent StackOverflow [answer][cors-heroku] that has some heroku specifics.

[cors]: http://en.wikipedia.org/wiki/Cross-origin_resource_sharing
[devise-token-cors]: https://github.com/lynndylanhurley/devise_token_auth#cors
[cors-heroku]: http://stackoverflow.com/questions/19939207/heroku-rails-4-and-rackcors?answertab=votes#tab-top

## JSON relevant things

Don't manually build json objects, don't call `to_json`!
There is a better way!

We can let `render json: @foo` build the JSON for us,
just define `def as_json(opts={})` on the model.

The `opts={}` is important! It gets called from a
variety of places and if they pass options and we don't
have opts defined, that's a 500!

Note that render takes a `:status => :status_name` option that
recognizes the following [codes][status-codes].

[status-codes]: http://apidock.com/rails/ActionController/Base/render#254-List-of-status-codes-and-their-symbols

## Testing

I'm hearing great things about [Postman](http://www.getpostman.com/)
but I have not used it personally. It's a free to install
chrome app, should be more pleasant to test your API with
than a hand-written HTTParty client or curl!

## Deploying to Heroku

There's a nice [getting started][heroku-start] guide.

#### tl;dr

1. Install the heroku toolbelt!
2. Go to your rails repo on the command line.

3. Tweak gemfile for postgres in production, sqlite in dev.
   If you want to switch to postgres for local development too,
   you'll need to run `brew install postgresql` and then you can
   change `gem 'sqlite'` to `gem 'pg'` rather than having one in
   development group, one in production group.

4. Add rails_12factor gem, specify ruby version. `bundle`!
5. `heroku login` and `heroku create`. Now your repo has a heroku git remote!
6. Push your app with `git push heroku master` and don't forget
   to migrate it with `heroku run rake db:migrate`!
7. Finally, you can start your app with `heroku ps:scale web=1`.

* You can push updates to your heroku instance with `git push heroku master`.
  No need to restart the workers. It "just works"!

[heroku-start]: https://devcenter.heroku.com/articles/getting-started-with-rails4

## Your Life in Production

Notes about things that are different in prod:
* You can't binding.pry so you have to reproduce bugs locally or look at log files.
* You can use `heroku logs` to see recent logs or `heroku logs --tail` to watch
  them live as requests hit the server!
* [Billing model][billing] is free with just one web worker/dyno per month.
  Some additional notes about [postgres][postgres] worth peeking at.
* [Email support][email] is an add-on that we ain't payin for.

[billing]: https://devcenter.heroku.com/articles/usage-and-billing#billing-cycle-current-usage
[postgres]: https://devcenter.heroku.com/articles/heroku-postgres-plans
[email]: https://devcenter.heroku.com/articles/smtp

## Let's Talk about Workflow with Other Teams

* You're responsible for data. You need to document your APIs!

* It's important to let the other teams have an idea of what
  data you'll provide soon so they can start working.
  They can mock up test data if they know something about
  what your requests and responses look like.

## Homework

Start your checkers app by getting a repo up under the github organization,
and deploying it to heroku with support for creating and deleting users via JSON API.

I'll put up a questions.md but for now: https://gist.github.com/twhitacre/ab69cdb77e9cc0be22ec
