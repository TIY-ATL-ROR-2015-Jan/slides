In this assignment, you'll work in pairs to build a basic twitter clone.
Make sure to read [Understanding Github Flow][understanding-github-flow].

Git is a tool that supports various different workflows.
Github Flow is a popular way of using git and there is a more in-depth
discussion of Github Flow [here][github-flow] in case you want more background.

[understanding-github-flow]: https://guides.github.com/introduction/flow/index.html
[github-flow]: http://scottchacon.com/2011/08/31/github-flow.html

## Teams

You will be working in pairs for this assignment.
The teams are as follows:

* samuel, evan
* will, nick
* vedika, brian
* mike, alan
* tyler, ian
* rachel, alex
* andrew, dylan

I don't know what will happen to poor Matt.

![jury-duty](http://media.giphy.com/media/LYaZVDq3g3zc4/giphy.gif)

## Installation

**ONLY** *one of you* should run `rails new shouthouse` to generate a new project.
Run `git init`, `git add .`, `git commit -m 'Initial commit.'` as you did for the weekend assignment
and then push that to a new repository named tweethouse on github. Your teammember should clone your repo.

Finally, [add your teammember to the project as a collaborator][collaborator] by following this guide.
This gives them permission to push changes to your repo.

[collaborator]: https://help.github.com/articles/adding-collaborators-to-a-personal-repository/

## Requirements

Build a simple microblogging app with users and "shouts".

1. One of you should define the routes as follows on master, commit and push that to github:

```
resources :users, :only => [:new, :create, :destroy, :index] do
  resources :shouts, :only => [:new, :create, :show, :destroy, :index]
end
```

2. If you need to, run `git pull origin master` to bring in the routing commit.
   Now create a branch named after your feature with `git checkout -b my-branch-name`.

3. One of your will do the user side of the app, the other the posts side.
   Use `rails g model whatever` to generate your migration and model file.

   Users should be a table with a username and password, both string columns.
   Shouts should be a table with a user_id, body, and created_at/updated_at (t.timestamps).

4. Finally, add controllers and views to supply the methods in routes.rb.
   1. To facilitate shouts being done separately from users, your shouts form should
      have a `user_id` field and you should use the explicit route style
      (`user_shout_path` as opposed to `[@user, @shout]`) in your views/`form_for` and `link_to` calls.

   2. Feel free to reference betterblog to see how we did something if you get stuck
      and ask in slack if it makes sense to do things the same way in "shouthouse".

   3. Remember you'll need to deal with "Strong Params" in your create methods for Users and Shouts.
      See the `post_params` and `user_params` methods in the betterblog controllers and read the
      [Strong Params section][strong-params] of the Rails guide for background/context.

   4. In the shouts controller's `index` method, you should not be able to refer to `@user` or `User`
      because your teammate is the one writing the model and migration for the User model and you don't
      have it yet! As a result, the index method should just return `@shouts = Shout.all` for the time
      being. It's okay that every "shouts index page" has the shouts for every user.

   Note: The views can be *real* ugly. :)

5. When you're done, [open a pull request][create-pull-request] and ask your partner to review your code.

Feel free to read [Using Pull Requests][using-pull-requests] for background
or ask me for help in channel.

[create-pull-request]: https://help.github.com/articles/creating-a-pull-request/
[using-pull-requests]: https://help.github.com/articles/using-pull-requests/
[strong-params]: http://edgeguides.rubyonrails.org/action_controller_overview.html#strong-parameters

## BONUS!

Use partials for the forms and show/index pages for your Users and Shouts.
You'll probably want to refer to the Rails guide on [Using Partials][partials].

[partials]: http://guides.rubyonrails.org/action_view_overview.html#partials
