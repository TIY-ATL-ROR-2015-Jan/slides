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

### Databases: sqlite / postgresql / mysql / oracle / mssql

## We're currently using sqlite. Camping stores the db at ~/.camping.db

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

## CRUD - Create / Read /  Update / Delete

## Create
* Full::PathTo::ModelClass.new (or .create which also saves for you)
  * Pass keyword arguments for all columns

## Retrieval
* Full::PathTo::ModelClass.stuff
  * count ( get the number of records in the table )
  * all ( return an enumerator for everything in the table ) USE WITH CAUTION!
  * where ( return an enumerator for everything matching the clause )
  * find (return a model instance by id)
  * find_by_$ ( return a model instance by column )
  * find_each ( return each model instance in turn )

## Updating ( good old accessors / update_attribute / update_attributes )
* model_instance.stuff (call it toy)
  * toy.name = 'foo' ( aka good old accessors, must be followed by toy.save )
  * toy.update_attributes :name => "foo" (saves for you, any number of attributes)

## Deleting ( delete / destroy )
* model_instance.stuff (call it toy)
  * toy.delete ( only kills it on the database side )
  * toy.destroy ( kills it database side, nils the ruby object, runs arbitrary helper code )

* So we're in pretty good shape now ...
  * Except no unit tests.
  * And we're not using the models for anything. T_T

## HW

Minor submission changes. From here on out, homework will be in separate repos.
As a result, questions.md will be in the lectures repo instead of labs.

* See questions.md
