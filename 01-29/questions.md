In this assignment, you'll build a basic messaging service!

It would be best to test your server and API by having some
documented API calls for a client and having one of your
friends try to send you a message via the API.

*Note:* API testing requires being on the same local network or
using something like [ngrok](http://ngrok.com) or [localtunnel](http://localtunnel.me/).

## Objectives

### Learning Objectives

* Understand how to route requests to different controller methods
* Know how to send and recieve input via queryparams or postdata
* Be comfortable constructing JSON to hand back to API consumers
* Be comfortable talking about APIs with your peers

### Performance Objectives

* `camping` controllers and routes
* `httparty` to hit controller endpoints
* Working with nested hashes / JSON
* Further practice with ActiveRecord

## Details

### Deliverables

Get your pairing assignment. Then ...

* Fork the notepasser repo on the class github page.
  Your server code should go in lib/notepasser.rb

* Any code you write to talk to another students API
  should go in the "clients" directory as `their_github_username.rb`

## Requirements

* Running `bundle exec camping -s webrick -h YOUR_IP_ADDRESS lib/notepasser.rb`
  should start a server that responds to all endpoints listed in the README.md

### Normal Mode

* Models: At least `User` and `Message` models are required.
  It certainly makes sense for a User to have many Messages.
  A `User` can just have a name on this difficulty.
  A `Message` should have a recipient_id, content/body, and read/unread status.

* API Calls:
  * Users: Support adding, retrieving, and deleting user accounts.
  * Messages: Adding a message, marking a message read/unread, deleting a message.
    It should also be possible to retrieve all messages for a given user.

### Hard Mode

Add some sort of authentication system (storing passwords
in cleartext in the database is fine) to prevent users
from accessing messages that aren't theirs.

Add support for blocking or flagging a user for abusive behavior.
A user that has been flagged cannot interact with the site in
any way. There is no appeals process. Obviously, this is a good
tool for abusive users to abuse users. *sigh* Write it anyway.

### Nightmare Mode

Track the sender of messages as well as the recipient.
Allow looking up messages by sender or recipient.

Auth should allow Users to view messages that they have
sent as well as those that they have received.

## Resources

* Check the [httparty docs][httparty], especially the [body/query notes][body/query]
* As always, the ActiveRecord [migrations][migrations] and [queries][queries] guides
* The camping docs on [Routes](http://camping.io/Book/-Getting-Started#Routes)
* Also note the use of `redirect` and `@input` [here][last]. It might be worth experimenting with.

* Perhaps most importantly, reread a bit about [restful APIs][rest]!

[httparty]: http://johnnunemaker.com/httparty/
[body/query]: http://www.rubydoc.info/github/jnunemaker/httparty/HTTParty/ClassMethods#post-instance_method

[migrations]: http://guides.rubyonrails.org/active_record_migrations.html
[queries]: http://guides.rubyonrails.org/active_record_querying.html

[last]: http://camping.io/Book/-Getting-Started#The-last-touch
[rest]: http://restful-api-design.readthedocs.org/en/latest/methods.html
