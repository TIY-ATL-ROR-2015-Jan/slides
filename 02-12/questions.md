In this assignment, you'll work in pairs to
build a simple Rails version of [Connect 4][c4].

[c4]: http://en.wikipedia.org/wiki/Connect_Four

Seeing as I've been out sick and unable to give guidance
the last two days there is a repo I started which your
team can fork and work from: [connect-rails4][c4-rails]

You should use the same teams as you did for the
homeworks this week. It would be valuable to swap
skype info so you can collaborate as needed over
the weekend without being in the same place.

*NOTE*: Try as best you can **not** to use generators
for this assignment. Ask classmates or myself if you're
not sure where a file should go or what an empty
controller/view should look like.

## Objectives

### Learning Objectives

* Understand how to put a complete Rails app together
* Know how to model basic control flow in a Rails app
* Further practice with associations and querying

### Performance Objectives

* Know how to authenticate users with [`devise`][devise]
* Be comfortable using [partials][partials] in views when needed

[devise]: https://github.com/plataformatec/devise/wiki
[partials]: http://guides.rubyonrails.org/layouts_and_rendering.html#using-partials

## Details

### Deliverables

I will open a github issue for each of you, in that issue
you should post a comment when you're done with:

* Your teammate and the repo you used
* Whether you kept going with your original design
  or forked [my repo][c4-rails]

[c4-rails]: https://github.com/TIY-ATL-ROR-2015-Jan/connect-rails4

### Requirements

* Running `rake db:migrate && rails s` should start
  a Rails server that can play Connect 4 as described below.

### Normal Mode

Your rails app should enable users to sign up and play a basic game of Connect 4.

Let's talk about what pages we need and then work backwards from there
to figure out the rest.

* Login/Signup
  * Thankfully, devise provides this. This is a reasonable place to start
    and is already set up in my repo.

* Users show page (i.e. `GET '/users/:id'`)
  * We'll need a way for users to see what games they are participating in
  * We'll need a way for users to try to play a new game

* Games show page (i.e. `GET '/games/:id'`)
  * Should display the board
  * If the game is finished, display the winner
  * If the game is not finished, allow the user to make a move *if* it is their turn

So, we need a route/controller method for any actions we want the user to take in our app.

The routes and controllers we definitely need are:

```
get '/users/:id', to: 'users#show'
get '/games/:id', to: 'games#show'
post '/games', to: 'games#join'
put '/games/:id', to: 'games#move'
```

And similarly, we'll need User and Game models at least.
I've defined User, Game, and Player models in my [connect-rails4 repo][c4-rails].
If you're feeling lost, I'd encourage you to start by forking that as
it has a reasonable data model.

### Hard Mode

* Add a scoreboard for users that tracks their performance.
* Make sure there are no N+1 queries in your app.
* Make it possible for a user to forfeit a game.

### Nightmare Mode

* Add an option to join a new game vs a computer.

## Resources


## Notes

In many ways, this is similar to Tic-Tac-Toe.
The biggest differences are in:

0. Board Representation
1. How to enforce taking turns in a Rails app.
2. How to start/join games. (i.e. lobbying/matchmaking)
3. The Win condition checking.
4. What moves are legal (pieces must fall to the bottom).

Let's talk about each of those in turn...

### 0. Board Representation

(sub-heading: Just use `serialize`.)

#### Board Representation 1 - Serialize It!

You probably remember that we just used an array for our board
in Tic-Tac-Toe. But SQL doesn't have an array column type.

This is a rare case when I would say that it's appropriate to
use `serialize`.

There isn't anything interesting to say about the squares on
a board. We don't want a "board_squares" table with SQL columns
named "row" and "column" that hold integers. We just want to
have a damn array that tracks moves.

So I have a `text` column called board on my games table and
in the model I have `serialize :board` at the top. Now we can
do `game.update_attribute :board, (1..64).to_a` and it will be
saved in the database just fine. Remember that when we declare
`serialize :column` on the model, it converts the objects to a
string representation (in YAML, by defaut) when storing it and
converts it back to a Ruby object when we read it.

#### Board Representation 2 - Flat Array or Multi-Dimensional Array?

As for whether to use a flat array (`[0..42]`) or some kind of
multidimensional array (`[[0..7], [0..7], ..., [0..7], [0..7]]`) is up
to you. Obviously it effects what indexes you have to use to access
moves, etc, but neither representation is obviously better in my
opinion.

### 1. How to enforce taking turns in a Rails app

Or, how the hell does a game with turns make sense in a web app?


### 2. How to start/join games


### Miscellaneous notes

I will try to check in on slack throughout the
day and flesh out the assignment some as I fight
through a monstrous headcold-induced coma.

* The Join Game link should:
  * be used *instead* of New/Create methods!
  * look for a Game with only 1 player and assign
    current_user as player2 if it finds one
  * otherwise create a new Game and assign
    current_user as player1
  * Either way, it can redirect to the game show page
    afterwards and then the player can take a turn.

* The Game show page should:
  * Print the board (duh).
  * Let the user go back to their show page.
  * Allow the user to place a move in any of the board's
    7 columns *if* it is their turn.
  * You can use a [`button_to`][button_to] on the top of each column
    to send a request to `PUT /game/:id/move` with the column
    number as data. Something *like* the following in your ERB template ...
    ```<%= button_to [:move, @game], params: { :column => i } %>```

[button_to]: http://apidock.com/rails/ActionView/Helpers/UrlHelper/button_to
