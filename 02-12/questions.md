In this assignment, you'll work in pairs to
build a simple Rails version of [Connect 4][c4].

[c4]: http://en.wikipedia.org/wiki/Connect_Four

You should use the same teams as you did for the
homeworks this week. It would be valuable to swap
skype info so you can collaborate as needed over
the weekend without being in the same place.

You are encouraged to use branches but your
decision to work on a single branch together
that vs splitting up to work on different
pieces of the problem is your call.

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

* Users show page
  * We'll need a way for users to see what games they are participating in
  * We'll need a way for users to try to play a new game

* Games show page
  * Should display the board
  * If the game is finished, display the winner
  * If the game is not finished, allow the user to make a move *if* it is their turn

So we need a route/controller method for any actions we want the user to take in our app.

The routes and controllers we definitely need then are:

```
get '/users/:id', to: 'users#show'
get '/games/:id', to: 'games#show'
post '/games', to: 'games#join'
put '/games/:id', to: 'games#move'
```

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

1. The Win condition checking.
2. How to enforce taking turns in a Rails app.
3. A lobbying / matchmaking system.
4. What moves are legal (pieces must fall to the bottom).

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
