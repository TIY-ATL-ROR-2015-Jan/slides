## Good Morning!

![alcohol](http://media.giphy.com/media/vyZBKDpUC0niE/giphy.gif)

![enjoy](http://wac.450f.edgecastcdn.net/80450F/starcrush.com/files/2013/08/pr-8.gif)

## Pain Points?

* Scrum?
* Git things?
* Heroku things?
* Else?

Here's one someone is bound to hit:
* Q: How do I get my clone setup to push to heroku?
  A: `heroku git:remote -a falling-wind-1624`

## Let's Talk about Pull Requests, Fork vs Clone

* A fork is a "remote" on github that has the repo
  you forked from as its "origin".

* When you create a pull request on a fork, by
  default it will be for merge into the original.

This is awesome for purposes of collaboration.
It's usually exactly what you want.

## Notes on Checkers

Data Representation is key.

Need agreed upon data representation early on so
Frontend and Mobile can start prototyping.

### Board Representation

```
[[0, 1, 0, 1, 0, 1, 0, 1],
 [1, 0, 1, 0, 1, 0, 1, 0],
 [0, 1, 0, 1, 0, 1, 0, 1],
 [0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0],
 [2, 0, 2, 0, 2, 0, 2, 0],
 [0, 2, 0, 2, 0, 2, 0, 2],
 [2, 0, 2, 0, 2, 0, 2, 0]]
```
  * American Checkers boards are 8x8.
  * So use a multidimensional array, divided by rows.
    Easy conversion to JSON, natural to import and
    use in JS or Objective-C or Swift.
  * [0,0] is top left, [7,7] is bottom right as expected.
  * 0 for empty, 1 for Player1, 2 for Player2,
    3 for Player1 King, 4 for Player2 King.
  * If you never add support for Kings no big deal,
    but define the data representation up front!

### Moves

2 kinds, simple moves and jumps.

```
[[5,0], [4,1]]
```
A simple move where player2 moves to an empty square.

```
[[5,0], [3,2], [1,0]]
```
A multi-jump where player2 jumps over enemies at
`[4,1]` and `[2,1]`.

Now the "move checking" can work move by move.

The server shouldn't have to "guess" how the player
got from `[5,0]` to `[1,0]`. Could be multiple valid ways!

Note that there are three different pieces of logic:
* Legal moves for player1 (downward)
* Legal moves for player2 (upward)
* Legal moves for player1 or player 2 kings,
  which can go "up" or "down"

### Games

* No need for an explicit turn_count column.
  * Checkers games are potentially infinite.
  * All you really need is a 0 or 1, `:even` or `:odd`.

* Finished column seems reasonable.

* Worth thinking about where you want to track wins and losses for a leaderboard.
  * Doesn't *need* to be coded today but worth thinking about.
  * Come up with two or three options if you can.

* As for how you do lookups and querying, `has_many through` fits.
  Users have many games through a join table, maybe called players, maybe user_games.

## Adding Avatars to Betterblog

We've got to support user file uploads.
Let's use [paperclip][paperclip]!

[paperclip]: https://github.com/thoughtbot/paperclip

## What Doesn't Work About This On Heroku

(Or, why might you need to store images on S3?)

[paperclip-heroku]: https://devcenter.heroku.com/articles/paperclip-s3
