## Part 0: QUIZ TIME!


Email your answers to brit@theironyard.com
You have until 9:40.

1. What are blocks? When do we like to use them?

`{|x| puts x+1 }` Prints out X + 1.

`{|x| code here }` `do |x, b| end` `{ puts "hi" }`

Block: Snippet of code passed to another method.

We want to send a piece of code to a method to tweak its
behavior. The snippet doesn't have a name! It's "anonymous".

This differs from a callback where we define a method
and reuse it by passing the symbol that names it around.
`before_action :authenticate_user_from_token!`

2. What does the `yield` statement do?

Yield calls any block passed in and then after the
block is finished control returns to the method that
called yield.

```
  def map!
    self.each_with_index do |value, index|
      self[index] = yield(value)
    end
  end
```
3. How often do Ruby programmers use `proc` and `lambda`?

Very rarely. VERY, very rarely.

Bonus:
* http://rubyquiz.bottega8.com/




## Part 1: CSS Frameworks + Asset Pipeline == :happiness

* You did etsy_search once. You need not do it for every project that comes along!
  Not only may there be frontend hackers or designers, you can use frameworks now!
  * [Bootstrap][bootstrap]
  * [Foundation][foundation]

[bootstrap]: http://getbootstrap.com/css/
[foundation]: http://foundation.zurb.com/






How easy are they to use in Rails? Very easy.
I finally felt guilty about how crap betterblog looked last night.
So I spruced things up a bit.

1. Add the bootstrap-sass gem!
   * Bootstrap isn't written in raw CSS, it's written in LESS.
     Rails doesn't use less by default, it uses SASS and
     thankfully there is a version of bootstrap written in SASS.

2. Since bootstrap is written in SASS, we need to use SASS to include it.
   Move `app/assets/stylesheets/application.css` to
   `app/assets/stylesheets/application.css.sass` and add some lines to
   pull in bootstrap.

3. Style things!

I just snagged a few tidbits from these blog entries:
* http://www.gotealeaf.com/blog/integrating-rails-and-bootstrap-part-1
* http://www.gotealeaf.com/blog/integrating-rails-and-bootstrap-part-2

There is much more bootstrap can do! Read the docs sometime. :)

## Part 2: Spotify Search Things

### Data Model First!

We need some kind of table to track song suggestions.
Remember that a user has many suggestions.

** Super important!
songs:
  user_id: integer
  artist: string
  title: string # Another Painful Day, An Example, Better with Beer, Can't We Lunch, etc
  spotify_id: string, :unique => true
  t.time stamps -> created_at and updated_at

Suggesting a song that has already been suggested before ...
* If spotify_id must be unique, then we find the old suggestion
  and update it for this week. But maybe a playlist needs to know
  the old suggestion. If there's a playlist table, it probably needs
  to be able to find the suggestion.
  I **strongly believe** each time a suggestion is made, we should create
  a new song_suggestion db record.

* Store votes *on* a suggestion? How do we enforce a user
  can only vote once? Maybe we wants users to be able to
  vote for a song more than once!

* Uniqueness from index on spotify_id.
  But that carries across weeks which might be bad ...
  `add_index :songs, :spotify_id, :unique => true`

song_votes:
    `belongs_to :user`
    `belongs_to :song`

# DO NOT WORRY ABOUT DEFINING THE WHOLE DATA MODEL TONIGHT. JUST SONGS.

So, we could have some search box on our site that makes a request to Rails
and the controller could get results from Spotify's API and show the user a
results page. ... But that seems awfully crappy! Can we do better?

## Resources

[Blocks, Procs, and Lambdas](http://code.tutsplus.com/tutorials/ruby-on-rails-study-guide-blocks-procs-and-lambdas--net-29811)
