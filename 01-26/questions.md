In this assignment, we'll investigate a small part of the Github API.
Be warned, many of the relevant API endpoints have stringent rate limits,
so you'll want to save the relevant data to your local machine and inspect it.

## Objectives

### Learning Objectives

After completing this assignment, you should…

* Be comfortable getting JSON data from an API
* Have more practice with storing and querying data using ActiveRecord models
* Appreciate some implications of storing data locally vs. using external data sources.

### Performance Objectives

After completing this assignment, you be able to effectively use

* `HTTParty`, at least the `get` method
* Part of the Github user API
* Nested hashes, as returned by Github via the `json` library
* ActiveRecord saving and querying commands

### Deliverables

* Fork the cheepcreep repo on the class github page.
  Write your code in lib/cheepcreep.rb.

## Details

In this assignment, you'll fork, clone, and expand on the `cheepcreep`
repo on the class organization github page. Your final product will pull
data from the Github API, put it in the database, and then print a sorted
list of users.

### Requirements

When run with `GITHUB_USER=foo GITHUB_PASS=bar bundle exec ruby lib/cheepcreep.rb`
the script should choose 20 of my (redline6561) users at random. Then it will get
their data and create matching database records for each one. Finally, it will
print a list of users sorted by the number of their followers.

## Normal Mode

1. Add a method that takes a username and returns a list of their followers usernames via the [followers call][followers] we saw in class.
2. Add a method to return data for a particular github user via the [user call][user_call].
3. Add a GithubUser model and migration in the Cheepcreep module with the following columns:
   * login
   * name
   * blog
   * public_repos
   * followers
   * following

   To see example data, have a look at the example response for the [user API call][user_call].

Query the database to print a list of the top users sorted by their follower count.

[user_call]: https://developer.github.com/v3/users/#get-a-single-user
[followers_call]: https://developer.github.com/v3/users/followers/#list-followers-of-a-user

## Hard Mode

Have the script take a command line argument for what to sort by: public repo count, follower count, or following count.

So you would run it like so: `GITHUB_USER=foo GITHUB_PASS=bar bundle exec ruby lib/cheepcreep.rb public_repos`

## Notes

* See the [Github API docs](https://developer.github.com/v3/)
* There is a gem for interacting with the Github API called [Octokit](https://github.com/octokit/octokit.rb).
  You should not use it for tonight's assignment, but: Would using it make this easier? How do you think it works?
