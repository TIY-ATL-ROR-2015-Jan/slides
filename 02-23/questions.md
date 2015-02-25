# spotibetical

## Description

Build a community-generated playlist sharing site.

## Due Date

Monday, March the 2nd before the start of class.

## Suggested Schedule

Tuesday:
* Get the user auth with devise setup
* Add [rspotify][rspotify] to the gem file
* Sign up for a [Spotify Developer/API key][spotify-api]
* Read you some docs: [Asset Pipeline][assets], [Unobtrusive JS][ujs], [Tim's notes from Week 2][tim-w2]

[rspotify]: https://github.com/guilhermesad/rspotify
[spotify-api]: https://developer.spotify.com/

[assets]: http://guides.rubyonrails.org/asset_pipeline.html
[ujs]: http://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html#built-in-helpers
[tim-w2]: https://github.com/tiy-atl-js-q1-2015/Notes/tree/master/Week%2002

Wednesday:
* Add a way for users to suggest songs that pulls track info from Spotify

Thursday:
* Add a way for users to vote suggestions for the weeks playlist up or down
* Add support for vetoing songs

Friday:
* Add an endpoint to view playlists from past week and a button
  to click that adds the playlist to the current user's spotify account
  * (This will invole OAuth authentication flows.

Saturday/Sunday:
* Bugfixing
* Hard-mode things
* Asking Brit and Josh questions
* Hanging out in Slack
* Drinking

## Objectives

### Learning Objectives

After completing this assignment, you should ...

* Be able to build a voting system
* Be able to build an app that interacts with another API via OAuth
* Be increasingly comfortable with building full Rails/MVC/CRUD apps
* Be able to run tasks at periodic intervals

### Performance Objectives

After completing this assignment, you should have effectively used ...

* `devise` for Authentication
* `rspotify` with OAuth for Spotify API interaction
* Pair Programming or Forks and Pull Requests for code review and effective collaboration

## Details

### Deliverables

* A repo containing a Rails app

### Requirements

* Running the app starts a server with features detailed below:

## Normal Mode

* Users have accounts and can login
* Users can propose songs for the week's playlist
* Users can spend points to vote on proposed songs
* At the end of the week, the top rated song is chosen for each letter A-Z and added to a playlist; that playlist is pushed to Spotify
* Users get a fixed number of points to spend at the start of each week
* Users get a bonus based on how many people voted for their suggestions last week
* Points do _not_ transfer week-to-week (use it or lose it)
* Users can veto one song pick per week
* Deploy your app to Heroku

## Hard Mode

* Add an admin-only section for managing user accounts
* [Use a background job][clockwork] to reset votes and vetoes each Friday at 5pm
* Support user-uploaded [avatars][paperclip] via Paperclip and S3

## Resources

[clockwork]: https://devcenter.heroku.com/articles/clock-processes-ruby
[paperclip]: https://devcenter.heroku.com/articles/paperclip-s3
#bootstrap with bootswatch for rails
[twitter-bootswatch-rails]:https://github.com/scottvrosenthal/twitter-bootswatch-rails
#bootstrap themes for web layout
[bootswatch]: http://bootswatch.com/

## Questions

If part of the requirements are unclear, ask me about it!
Maybe I'll ask you to fork the lectures repo and make a pull request that clarifies this document. :)
