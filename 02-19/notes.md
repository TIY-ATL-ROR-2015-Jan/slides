## Good Morning!

Sup doges?

![sup](https://ofdoge.files.wordpress.com/2013/12/doge-1.jpg?w=605)

## I Have a Surprise For You

![morning](http://images2.memedroid.com/images/UPLOADED60/521e9cc53ec1f.jpeg)

Lecture will be over by 10:30 today.

By the end of the day, your Heroku apps will hopefully support:

* Creating a user
* Getting a user's auth token (by sending their email+pass, of course)
* Creating a new game
* Joining an existing game
* Making a move (with rejection of at least some invalid moves)

## One Other Checkers Note

* There are actually three ways for clients to send the `auth_token`.
  You know two ... but the third may be preferable and is worth supporting.

* Quiz Time: What are the two current ways to pass `auth_token`?

* Quiz Time 2.0: What do requests and responses both have?

## So what will we cover?

Background workers!

People have used background workers with Rails for years.

Predominantly through `resque` and `sidekiq`.

But [Rails 4.2 added][rel-notes] a background worker system called ActiveJob!

Let's see both ways ...

[rel-notes]: http://weblog.rubyonrails.org/2014/8/20/Rails-4-2-beta1/

## Sidekiq first

1. Have an interesting project. (Failed.)
2. Grab a repo with rails + devise setup. (coffeeme!)
3. Now let's teach it to grab cats (did that actually...)
4. Note that there is some jank because the point of
   this is to discuss (and see an example of) Job Queues.
5. Peak at the controllers and ["Service Object"][service-objects] right quick.

6. Write a background job! (probably referring to notes because sleeeeeeeepy)

[service-objects]: https://blog.engineyard.com/2014/keeping-your-rails-controllers-dry-with-services

## Now ActiveJob!

[ActiveJob][active-job] does things a bit differently.

One nice difference is thanks to the new "GlobalID" system,
we don't have to pass ActiveRecord (or AR) ids and then do
the lookup in the Job.

But we still will probably want to layer ActiveJobs on top
of some underlying job queue like Resque or Sidekiq.

## Overall Notes

A few things to note:

* In "the real world" you will often have multiple
  queues for different sorts of jobs.
* There are ways to have jobs run periodically and
  jobs that just run once.
* Since you don't control exactly *when* the job
  runs, the data could change between when you
  queue the job and it happens. This makes error
  handling/thoughtfulness important.
* It also makes monitoring important. Hence many
  job queues come with a built-in monitoring app
  you can mount!

[active-job]: http://edgeguides.rubyonrails.org/active_job_basics.html

## Homework Things

It's probably 10:30.

High-level target for the day is for players to be
able to make moves on a board.

Once that is working "naively", start on validation,
taking enemy pieces, etc.
