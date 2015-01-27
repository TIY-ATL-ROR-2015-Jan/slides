In this assignment, we'll expand on yesterday's work with the Github API.
Be warned, many of the relevant API endpoints have stringent rate limits,
so you'll want to save the relevant data to your local machine and inspect it.

## Objectives

### Learning Objectives

After completing this assignment, you should…

* Be comfortable working with a REST API
* Understand how Basic Authentication, Pagination, and
  Parameter restrictions impact use of common Web APIs

### Performance Objectives

After completing this assignment, you be able to effectively use

* `HTTParty`, at least for non-Oauth APIs
* Various parts of the Github User and Gist APIs
* Nested hashes and parsing them from JSON

### Deliverables

* Continue to work in lib/cheepcreep.rb

## Details

Make sure your Github class is set up to use basic authentication!
Expand the Github class to use basic authentication and support interacting with
the bulk of Github's Gist API endpoints.

### Requirements

When run with `GITHUB_USER=foo GITHUB_PASS=bar bundle exec ruby lib/cheepcreep.rb`
the script should drop me in a pry session and allow me to interact with the Gists
in the account provided via GITHUB_USER.

## Normal Mode

In this assignment, you'll teach Cheepcreep how to [list a user's gists][list-gists],
[create a new gist][create-gist], [edit a gist][edit-gist], [delete a gist][delete-gist],
[star a gist][star-gist], and [unstar a gist][unstar-gist].

Do this by adding appropriate methods to your github class. Test them in
IRB but don't add code to create models or migrations for these methods.

Protip: Remember that you'll need to call .to_json on the value of
[:body][post_body].

The **Create** and **Edit** methods are a bit tricky. Do them last.
In particular, you'll want their methods to take a file path and
put its contents into the gist files array with [File.read][file-read].

[list-gists]: https://developer.github.com/v3/gists/#list-gists
[create-gist]: https://developer.github.com/v3/gists/#create-a-gist
[edit-gist]: https://developer.github.com/v3/gists/#edit-a-gist
[delete-gist]: https://developer.github.com/v3/gists/#delete-a-gist
[star-a-gist]: https://developer.github.com/v3/gists/#star-a-gist
[unstar-a-gist]: https://developer.github.com/v3/gists/#unstar-a-gist

[post_body]: http://www.rubydoc.info/github/jnunemaker/httparty/HTTParty/ClassMethods#post-instance_method
[file-read]: http://ruby.bastardsbook.com/chapters/io/

## Hard Mode

Disconnect the Wifi or stop doing basic authentication and run your rate limit out.
How does your Client handle failure?

Improve this with a combination of status code checks and exception handling with `rescue`.

## Nightmare / Why would you do this??? Mode

Investigate [thor](http://whatisthor.com/) as a way to give the API client
a nice shell interface. How complicated would it be to take your Toodoo app
from Weekend Assignment #3 and wire it up to use a Gist for each task list?

## References / Extra Reading

For an overview of the primary HTTP methods in RESTful API design
and a decent discussion of PATCH vs PUT, see [this](restful).

For an entertaining rant from a guy yelling about how Github (and most sites)
are using PATCH the wrong way, see [this](rants).

[restful]: http://restful-api-design.readthedocs.org/en/latest/methods.html
[rants]: http://williamdurand.fr/2014/02/14/please-do-not-patch-like-an-idiot/

## Notes

* See the [Httparty docs](http://johnnunemaker.com/httparty/)
* See the [Github API docs](https://developer.github.com/v3/)
* There is a gem for interacting with the Github API called [Octokit](https://github.com/octokit/octokit.rb).
  You should not use it for tonight's assignment, but: Would using it make this easier? How do you think it works?
