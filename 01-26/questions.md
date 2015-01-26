In this assignment, we'll investigate a small part of the Twitter
social graph. Be warned: many of the relevant Twitter API endpoints
have stringent rate limits, so you'll want to save the relevant data
to your local machine in order to inspect it.

## Objectives

### Learning Objectives

After completing this assignment, you should…

* Be comfortable getting JSON data from an API
* Have more practice with storing and querying data using ActiveRecord models
* Have some practice thinking about exceptions and error handling
* Appreciate some implications of storing data locally vs. using external data sources.

### Performance Objectives

After completing this assignment, you be able to effectively use

* `HTTParty`, at least the `get` method
* Part of the Twitter friend API
* Nested hashes, as returned by Github via the `json` library
* ActiveRecord saving and querying commands
* `ARGV` for reading command line arguments
* Use of `rescue` to handle network failures or API limits

## Details

Ask your instructor for a list of 20 tweeps to creep on.

### Deliverables

* Fork the cheepcreep repo on the class github page.
  Write your code in lib/cheepcreep.rb.

### Requirements

* Running `bundle exec ruby lib/cheepcreep.rb fetch` will grab and save friends until it hits rate limits.
* Running `bundle exec ruby lib/cheepcreep.rb analyze` will report on the saved friends.

## Normal Mode

We'll focus on users 1) in the provided list, 2) following users in
the provided list, and 3) followed _by_ users in the given list (their
"friends" in Twitter-speak).

For each user, save at least their:
* Name
* Follower count
* Friend count
* Tweet count

Obviously, this should require a "Tweeter" model + migration.

Fetching users should grab as many as it can, failing gracefully if
it hits a rate limit.

Running an analysis should print out a list of the top 5 most popular
(most followed) users in the data set, with links to their profile.

## Hard Mode

Ensure that the script does fetch _all_ of the persons of interest,
if run enough times to get past rate limiting problems.

## Notes

* See the [Twitter API docs](https://dev.twitter.com/rest/public) - `GET friends/list` and `GET follwers/list` are probably the most important endpoints for this assignment.
* There is a [Twitter gem](https://github.com/sferik/twitter). Would using it make this easier? How do you think it works?
* A gem like [Thor](https://github.com/erikhuda/thor) might be helpful in making a robust script with subcommands and help messages.
