In this assignment, you'll resolve merge conflicts
from last night's work, refactor code as needed,
and add follower / following relationships as on twitter.

We're pair programming now. Whoever did the coding yesterday,
you're backseat today. Your partner will review and merge your
work, cut a new branch off of master, add relationships
to your "shouthouse" project and open a pull request.

## Teams

You will stick with the teams from last night.
As a reminder, they are:

* samuel, evan
* will, nick
* vedika, brian
* mike, alan
* tyler, ian, matt
* rachel, alex
* andrew, dylan

## Installation

This will use the same "shouthouse" repo as last
night's project. The first step is to review and
merge your partner's pull requests on github.

If you have merge conflicts, discuss them with me,
Josh, or another student.

Once that is done, you should run `git checkout master`
and `git pull` on your local clone. All work for this
assignment should be done on a branch, maybe call it `relationships`.

You will pair program for this assignment, which
means the two of you will share a keyboard but
does not look like this:

![double-hacking](http://i.kinja-img.com/gawker-media/image/upload/s--FG3fHddU--/c_fit,fl_progressive,q_80,w_636/19g2zgshh3l60gif.gif)

Only one person per team should have their computer
open, the other team member is there to help check
that the code makes sense, help think about design
issues, and help debug.

## Deliverables

At the end of the session, have your partner review and
merge your code. Finally, you may close your assigned
github issue from Monday with a list of branches worked
on and the link to your repo! :)

## Requirements

Your app should support users following and being followed
by other users.

You will need to:

* Add migrations, models, and associations as needed to
  support users following and being followed by other users.
  * You can copy paste code (semi-liberally) from the betterblog "relationships" branch.
    see: https://github.com/TIY-ATL-ROR-2015-Jan/betterblog/commit/b80d27635fcdfa5427207b77990cc6dc8536b74d
    see: https://github.com/TIY-ATL-ROR-2015-Jan/betterblog/commit/e0317ae87b9095f1c3299a4ee6b4b6ea5412c2b6

* Add routes, controller methods, and views as needed to:
  * get a list of a specific user's followers
    Suggested route: `get '/users/:user_id/followers', to: 'users#followers'`
  * have the current user follow another user
    Suggested route: `put '/users/:user_id/followers', to: 'users#follow'`
  * have the current user unfollow another user
    Suggested route: `delete '/users/:user_id/followers', to: 'users#unfollow`

The "list followers" route should have a view.
The others can just make a change in the database and
redirect to the `users#index` page.

Finally, you should not be able to follow or unfollow yourself.
It's fine to just not include follow/unfollow links for the
`current_user` on the `users#index` page but consider briefly
how to enforce this as a [model validation][validations].

[validations]: http://guides.rubyonrails.org/active_record_validations.html

## BONUS 0

Update the Users index page so that there aren't links:

* To follow a user you're already following
* To unfollow a user you're not currently following

## BONUS 1

Add support for users to mark their accounts "private"
in which case they cannot be followed. Devise added a
route and form for editing a user.

*NOTE*: Your work may be done as part of the `relationships`
branch since it depends on it.

You will need to:

* Write a migration to add a new boolean column to the User model.
* Add an "Account Settings" link for logged in users to hit Devise's `edit_user_registration` route.
* Modify the `devise/registration/edit.html.erb` view to have a
  checkbox field for the privacy setting.
* Adjust the strong params setting for devise in the ApplicationController.
  See: https://github.com/plataformatec/devise#strong-parameters

## BONUS 2

Read the docs for [kaminari][kaminari] and cut a new branch
off of master that uses it to provide pagination support for
the `index` methods in all your controllers.

[kaminari]: https://github.com/amatsuda/kaminari

## Resources

[ActiveRecord Associations Basics]: http://guides.rubyonrails.org/association_basics.html
