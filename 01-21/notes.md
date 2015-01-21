## Part 1: Homework Review / Questions

## Intermezzo

* Trying to make compelling examples with just models is hard.
  * Trying to write terminal apps (esp small ones) that have any sort of UI is unpleasant.
  * Doing interesting things with models requires an interesting data set or complex schema.
  * Pondering my options. Want us to absorb models but not waste time trying to build terminal apps.

## Part 2: Let's add a scoreboard to Tic-Tac-Toe!

* Add a method to display a scoreboard. It should ...
  * Look at all players and count the number of games won and games finished.
  * List those players with games won / games played, sorted by win percentage.

## Part 3: Let's build a blarg!

* Ya'll I wrote a terrible thing last night.
* I just started typing and the next thing you know I had 150 lines of crazy code...
* Just so that we could get some posts into our database to play with.
* So let's briefly talk about where the code is at, accept that I've written a bunch of magic ...
  and start building some models and interacting with this thing! Play with data!

1. Add a post model and migration. Get stuff importing. Do it wrong (tags == serialize).
2. Add a tag && tagging model and migration to remove the "serialized" tags.

## Part 4: Relations / Joins

* Tags are perhaps the canonical example of a many-to-many relationship.

* one-to-one (customer has one address)
* one-to-many (customer has many orders)
* many-to-many (post has many tags)

## Part 4: Validations & Serialization

* Now let's make sure the user *always* has a name. Validations!
  * Might as well always be a unique name as well, right?
  * see: http://guides.rubyonrails.org/active_record_validations.html

* Uh-oh! How the hell are we gonna store guesses / sets?
  They're not a supported data type!
  * Use a serializer!
  * Luckily, ActiveRecord's serialize method seems to work nicely on Sets.
  * see: http://apidock.com/rails/ActiveRecord/AttributeMethods/Serialization/ClassMethods/serialize

* Now, let's make sure to set finished in the database if the game is over.
  * Why? Because if we don't, we have to retrieve each thing from the
  database, create a ruby object from it, and call finished? on that object. Lots of performance overhead for 'show me the finished things'.
  * Callbacks, USE WITH CAUTION! Hard to figure out 'why is this happening'. Especially in larger codebases.
  * Also, why make a method private?
    * for what private means see: http://stackoverflow.com/a/3534581

# HW

* Add support for viewing a list/index of posts that match a tag or group of tags.
* Add support for viewing a list/index of posts by month.
