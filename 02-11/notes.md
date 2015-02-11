## Notes from Yesterday

* Most people are having git issues by now. And that's great.
  (Seriously, half the point of having ya'll do pairing and
  branching is to make the hackathon less surprising and scary.)
  **POLL**: If your team has had a merge conflict, raise your hand.

* The correct response to a merge conflict is to merge master into
  *your* branch, thereby bringing in the new commits on master.
  *It is the responsibility of the "brancher" to make their code cleanly mergeable.*

* An important side note, **NEVER FORCE PUSH TO MASTER FOR ANY REASON**.
  When you force push to master, you forcibly change "history" and *always*
  screw up git for **everyone else** working on the project.
  Key point: Don't be a life ruiner.

* Note that the database isn't version controlled, so if you have *run*
  migrations, the database is *still migrated* on a different branch.
  You can fix this by rolling the database back with `rake db:down`
  or `rake db:migrate VERSION=201502123412341234whatever`

* No one should ever try to lecture after 1pm, especially me.
  DON'T TRY IT!

## Good News

1. In "the real world", you'll usually design a sane user model (with email).
   You might even have devise generate your user model for you. That way you
   won't have to do slightly [weird and gross things][devise-hack] in the
   devise migration like fake email addresses for existing users. :)

2. We were on the right track with our blog tags/associations yesterday,
   but I made two simple mistakes and was too tired to put it all together.
   (See again: Don't lecture after 1pm.)

[devise-hack]: https://github.com/TIY-ATL-ROR-2015-Jan/betterblog/commit/cc712667e33d41c0a17a3203cc5c3040b370cfae#diff-ec0ec09b757bb4b83ab33aa8f3eafe10R39

We'll cover those mistakes in just a second. But first ...

## QUIZ TIME!

Go to http://goo.gl/1IQ2CK and follow the instructions!

Let's talk about it for a sec!

## How to Tags some BlrgPsts

Let's look at the last commit on the tagging branch of betterblog...
It has that "Brit is drained and trying too hard" feel ...

* Red Flag #1: **WHAT THE HELL IS THIS LOGIC DOING IN THE CONTROLLER**

  (especially the `sync_post_tags` method, aka Brit is too fried to lecture)

  Logic to make dealing with the tags association more convenient should
  go on the *model* for heaven's sake. Sheesh.

* Red Flag #2: The logic to set the tags attribute and get the list
  of tags in a non-relation format is screaming out for a getter and setter!

* Mistake #1: Trying to have the model field be named after the association.

  ![bad-time](http://static.carthrottle.com/workspace/uploads/comments/youre-going-to-have-a-bad-time-54b187940239e.png)

  Let's call it :tag_names instead!

* Mistake #2: Trying to *manually* create the `PostTag` objects.
  If you set `post.tags` to an array of `Tag`s, when `post` is saved,
  ActiveRecord creates the instances in the join table for you!
  So like, map over the tags with `Tag ... first_or_create!` or something.

  **NOTE**: `find_or_create_by_foo` doesn't work with multiple attributes
  in Rails 4 and it seems they're shifting towards the `first_or_create`
  pattern.

  *Aside*: I wonder how generated SQL differs between `where(:foo => bar)`
  and `find_or_create_by(:foo => bar)` in the `first_or_create!` case.

## Now let's add those tags to the index page

* 5 minutes pass ...

## Oh God, Oh God, What's in the server query log?!?

* 10 minutes pass ...

* Discuss N+1s and .includes(:tags)
  I.e. The Algorithmic Complexity / Orders of Growth of SQL-land

## Now about those twitter relationships and homework

What time is it?

I was roughly on the right track yesterday, just too tired to
think straight. Also, it might seem like you want [self-joins][self-joins]
for this if you were poking around the docs but you don't.

[self-joins]: http://guides.rubyonrails.org/association_basics.html#self-joins

Maybe talk for a minute about why we want [has_many through][h-m-t]?

[h-m-t]: http://guides.rubyonrails.org/association_basics.html#self-joins

*Check the scratch buffer*

```
## On the User model
class User
  has_many :followed_relationships,
           class_name: 'User', foreign_key: 'follower_id'

  has_many :followers, through: :followed_relationships

  def follow(user)
    self.following.where(:followed_id => user.id).first_or_create!
  end

  # other methods we probably want on the model:
  # unfollow(user), follows?(user)
end

class Relationship
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'
end
```
