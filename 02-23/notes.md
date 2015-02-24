## Happy Tuesday!

And welcome to week 8, land of [Javascript][rails-js] and DOMs
and [Asset Pipelines][assets].

## Part 0: The Asset Pipeline

Enabled by default in new projects.
It's the thing that reads in stylesheets and javascript
and includes them on pages served by Rails.

### Asset Pipeline - High-Level Goals

* Concatenate assets - i.e. Put files together so pages load faster
  * A request for 1 big file is faster than 10 requests for little files

* Minify/Uglify assets - Compress or shrink the size of files by any available means.
  CSS can get whitespace ripped out. JS can use various tricks to save characters.

### Asset Pipeline - Fingerprinting and Search

* All assets are "fingerprinted" for caching.
  * Asset pipeline generates copies in `public/assets` when Rails starts.
  * All files are named with a hash generated from the file contents.
    * This way browsers/ISPs can cache the file but as soon as the contents
      change, Rails serves a version with diff name, invalidating the cache.

* There is a search path (think `$PATH`) for assets
  * `app/assets`, `lib/assets`, `vendor/assets`
  * Rails includes js files via ["manifests"](manifests).
    For an example, we can look at `app/assets/javascripts/application.js`

[manifests]: http://guides.rubyonrails.org/asset_pipeline.html#manifest-files-and-directives

## Part 1: Adding AJAX-style Commenting to Betterblog

> This betterblog thing sucks.
> I'll just fork it and add comments right quick.
> That way I can leave a comment telling the author it sucks.

* Brit makes Josh an owner on betterblog.
* Brit forks betterblog and creates a branch with comments.
* Open pull request!
* Josh asks for AJAX-y goodness.
* Do it in the spirit of open source!

## Part 2: Javascript (and maybe jQuery/DOM things?)

[Javascript vs jQuery vs DOM][js-jquery-dom]

Let's blow through Tim's notes super fast!

* https://github.com/tiy-atl-js-q1-2015/Notes/blob/master/Week%2002/Tuesday.md
* https://github.com/tiy-atl-js-q1-2015/Notes/blob/master/Week%2002/Wednesday.md
* https://github.com/tiy-atl-js-q1-2015/Notes/blob/master/Week%2002/Thursday.md

## Homework

Teams are as follows:

rachel, nick
vedika, will
alex, alan
mike, ian
andrew, brian
dylan, evan
matt, samuel

There is an assignment partially written up to build an app for
creating weekly spotify playlists. You will be pairing up for this.

The idea is that users can login, suggest songs for the weekly playlist,
and have a designated number of points and vetos to vote with each week.
At the end of the week, the top rated song starting with each letter A-Z
will be chosen and added to a playlist created on spotify.

Start tonight by creating a Rails app with devise, signing up for a
[Spotify API key][spotify], and adding the [rspotify][rspotify] gem.
There will be a formal questions.md and github issues shortly.
**Note that I have an interview at 3pm!**

Remember that as with the Etsy Search project you don't want to commit
your API key into github, pull it from an environment variable with an
initializer!

[spotify]: https://developer.spotify.com/
[rspotify]: https://github.com/guilhermesad/rspotify

## Resources

[js-jquery-dom]: http://jeffgran.com/2009/06/03/javascript-jquery-vs-the-dom/
[assets]: http://guides.rubyonrails.org/asset_pipeline.html
[rails-js]: http://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html#built-in-helpers
