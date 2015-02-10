In this assignment, you'll resolve merge conflicts
from last night's work, refactor code to use the User
model as needed, and add authentication via devise.

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
assignment should be done on a branch, maybe call it `user-auth`.

You will pair program for this assignment, which
means the two of you will share a keyboard but
does not look like this:

![double-hacking](http://i.kinja-img.com/gawker-media/image/upload/s--FG3fHddU--/c_fit,fl_progressive,q_80,w_636/19g2zgshh3l60gif.gif)

Only one person per team should have their computer
open, the other team member is there to help check
that the code makes sense and help think about
design issues.

At the end of the session, push up your branch and open a
pull request for your partner to review and merge tomorrow.

## Requirements

You must add authentication to your app via devise.

1. Install Devise.
   The steps involved are described in the
   [Getting Started][getting-started] section of the
   Devise wiki. As in class, you'll need to add 'devise'
   to the gemfile, bundle, and use the various generators
   to get devise set up. Pay careful attention to the output
   from the `rails g` commands.

2. Use Devise.
   After that's done, you may use the methods from the
   [Controller filters and helpers][cfah] section (such as
   `current_user`, etc) in your controllers. You should audit
   your user and shout controllers to make them safe as you
   deem fit. At a minimum, I would think that means login
   needed for anything but `:show` and `:index` methods
   and keeping users from deleting, editing, or creating content
   for other users.

[getting-started]: https://github.com/plataformatec/devise#getting-started
[cfah]: https://github.com/plataformatec/devise#controller-filters-and-helpers

## BONUS

Have some support for "admin" users. The app should not
restrict them editing or modifying other users content
but it should still restrict regular users as expected.

## Resources

You may want additional background to supplement today's
presentation. If that's the case, the best introductory article
I'm aware of discussing the use of Devise in Rails is [here][intro]
and some additional information on how sessions are handled in
Rails is present [here][sessions].

[intro]: http://www.gotealeaf.com/blog/how-to-use-devise-in-rails-for-authentication
[sessions]: http://guides.rubyonrails.org/security.html#session-storage
