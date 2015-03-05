## Quiz Time!

Quiz! You've got until 9:25. http://goo.gl/iCz8AC

Email your answers to `brit@theironyard.com`.





[multipart-1]: http://stackoverflow.com/questions/4007969/application-x-www-form-urlencoded-or-multipart-form-data
[multipart-2]: http://www.huyng.com/posts/under-the-hood-an-http-request-with-multipartform-data/


## Let's Send Some Emails

So, it turns out running a mail server is actually *fiendishly*
complicated.  Like, email is monstrous, we just think it's mundane
because it happily, quietly works.  It's definitely not something we
should have to do to just *send* emails.

I can even talk about this some next week because I spent December
setting up my own mailserver at `kingcons.io` to see how do. Thankfully,
It turns out you can send mail via someone else's mailserver that you
have an account with and there is a protocol (from the early 80s) for
doing this called [SMTP][smtp].

You could do this with your gmail account but that would be awful weird.
So we'll use [Mandrill][mandrill] by the folks at Mailchimp! :)
There's a heroku add-on and the free plan comes with 12,000 emails a
month. That ought to work for us.

[smtp]: http://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol
[mandrill]: https://devcenter.heroku.com/articles/mandrill





## Have Mandrill, Will ActionMailer

Now that we have Mandrill enabled, we can do a bunch of things.

* We can make user accounts email confirmable via devise with a simple migration.
* Well, hell, we can send mail for arbitrary reasons about arbitrary things.

ActionMailer is Rails way of sending email at random.
It's a little weird but the [docs][actionmailer] actually explain it really well.
There's a [guide][mailer-guide] but, as is frequent with the Rails guides,
it's exhaustive at the cost of being long-winded and overwhelming.

You can `rails g mailer MyMailer`.
I would steer clear of it while you learn the basics.

There are really only 2 important things:

1. Mailers
  * Live in `app/mailers`.
  * Much like controllers, there's an `ApplicationMailer` and subclasses.
  * Have methods that define instance variables and call `mail`.
2. Views
  * Live in `app/views/my_mailer/method.html.erb or method.text.erb`.
  * Are really boring otherwise, even more so than normal views. :)

You can send mail from a controller as follows:
* `MyMailer.my_email(foo).deliver_later` (queue it for delivery with ActiveJob)
* `MyMailer.my_email(bar).deliver_now`

There are also [options][deliver_opts] to deliver_later:
* `wait`
* `wait_until`
* `queue`

[actionmailer]: http://api.rubyonrails.org/classes/ActionMailer/Base.html
[mailer-guide]: http://guides.rubyonrails.org/action_mailer_basics.html
[deliver_opts]: http://edgeapi.rubyonrails.org/classes/ActionMailer/MessageDelivery.html





## To The Invitemobile!

But we really don't have a good reason to email users yet.
We need to add support for uploading all kinds of files
and being able to browse a user's files.
We'll roll this by hand.

We also want an invite system for users.
This is just annoying enough that I don't want to do it
by hand. Let's use [a library][amistad]! (But I found a solid
description of [how you might do it by hand][friendships].)

[amistad]: https://github.com/raw1z/amistad
[friendships]: http://stackoverflow.com/questions/25101089/mutual-friendship-rails-4


## Potential Improvements

* Styling/Layout/UX (duh)
* [Direct File Upload][dfu] (bypassing Rails will be mo betta)
* Better ways of viewing and navigating large file lists.
* Pagination things.
* Background job things? Could do all uploads as background jobs, helps some, but blech.

[dfu]: https://devcenter.heroku.com/articles/direct-to-s3-image-uploads-in-rails#s3-sdk
