# 09:00 am

## Prelude

* Questions about the weekend assignment and how to Classes?
  SAVE IT FOR REVIEW @ 2!

## Part 1: New Debugging Rules!

* What is it doing?
* What do you expect it to do?
* What are 2 things you have tried to fix it?

## Part 2: Scoping Review

* Let's look at ttt.rb's Player class.
* Is @name visible?
* Is choose_move visible?
* Where is name visible?

* Let's look at the TicTacToe class.
* What is the attr_accessor for :players doing?
* What about the attr_reader for :draw?
* Where is @next_player visible?
* Is `choose_move` visible in TicTacToe class?

# 09:30 / 09:40 am

## part 3: bundle gem guess.db

* bundle gem $gem_name scaffolds out a project for you.
  * It autowrites some code for you so no dots, colons, dashes, etc.
* Add sqlite3, camping :git, and pry to the gemfile.
* Flesh out gemspec right quick.
* Run bundle to pull in deps. Commit. What is a dependency tree?

# 10:00 am

## Part 4: Let's do some camping!

guess.db should:
- Let you pick or enter a new player name.
- Pick an unfinished game or start a new game.

* Let's make hangman save games. What do we need? ...
  * A database! Camping uses sqlite by default, stored in ~/.camping.db
  * Creating Tables: The database has to know the format of our data.
    As a result, we define something called a schema.

    * Tables for: Player, Hangman.
    * A brief discussion of column types. (Note that guess was a set.)
      * see: http://stackoverflow.com/questions/3956186/where-is-the-documentation-page-for-activerecord-data-types

* Now let's try it out!
  binding.pry doesn't work quite as well in this setting.
  Because we'd rather not manually establish a database connection
  every time, we "bundle exec camping -C lib/guessr.rb". :-/

* We'll now create a User, save it, delete it.

  Player = Guessr::Models::Player
  brit = Player.new(name: 'brit') # written :name => 'brit' in older rubies
  brit.save

  # brit = Player.create(name: 'brit') will make an instance and save it
  # Quit
  `toy = Guessr::Models::Player.all.to_a`
  toy = Guessr::Models::Player.where(name: 'brit')
  toy = Guessr::Models::Player.find_by_name('brit')
  toy.destroy

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

* So we're in pretty good shape now ...
  * Except no unit tests.
  * And we're not using the models for anything. T_T

## HW

Minor submission changes. From here on out, homework will be in separate repos.
As a result, questions.md will be in the lectures repo instead of labs.

* See questions.md
