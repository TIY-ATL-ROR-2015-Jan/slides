In this assignment, you'll work in pairs to
build a simple Rails version of [Connect 4][c4].

[c4]: http://en.wikipedia.org/wiki/Connect_Four

In many ways, this is similar to Tic-Tac-Toe.
The biggest differences are in:

1. The Win condition checking.
2. How to enforce taking turns in a Rails app.
3. A lobbying / matchmaking system.
4. What moves are legal (pieces must fall to the bottom).

I will try to check in on slack throughout the
day and flesh out the assignment some as I fight
through a monstrous headcold-induced coma.

* You'll need user sign up and auth with devise.
  This is as reasonable a place to start as any.

* A game has a board, a turn_count, and
  belongs_to 2 players. Note that this doesn't
  require any of the crazy has_many :through magic
  we've seen the last two days. Note that since a
  game belongs to *2* users it doesn't make sense
  to nest its routes under /users.

* The User show page should:
  * have a link to any games currently in progress
  * have a "Join Game" link

* The Join Game link should:
  * be used *instead* of New/Create methods!
  * look for a Game without a player2 and assign
    current_user as player2 if it finds one
  * otherwise create a new Game and assign
    current_user as player1
  * Either way, it can redirect to the game
    afterwards and allow them to take a turn.

* The Game show page should:
  * Print the board (duh).
  * Let the user go back to their show/games page.
  * Allow the user to place a move in any of the board's
    7 columns.
  * You can use a [`button_to`][button_to] on the top of each column
    to send a request to `PUT /game/:id/move` with the column
    number as data. Something *like* the following in your ERB template ...
    ```<%= button_to [:move, @game], params: { :column => i } %>```

[button_to]: http://apidock.com/rails/ActionView/Helpers/UrlHelper/button_to

## Objectives

### Learning Objectives

### Performance Objectives

* `devise` for authentication

## Details

### Deliverables

### Requirements

* Running `rake db:migrate && rails s` should start
  a Rails server that can play Connect 4.

### Normal Mode

## Resources
