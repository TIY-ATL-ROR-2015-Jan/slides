In this assignment, we'll expand on today's in class example.
You may want to refer to the [Rails Command Line guide][rails-cli] for commands.
You should only need `rails c`, `rails s`, and `rails g migrate`.

## Installation

Fork and clone the betterblog repo. Then run `bundle` and `rake db:migrate` on your clone.

*NOTE*: There is a binding.pry in the PostsController's create method. You probably want to take that out. :)

## Homework

1. The app has User and Post models. Add an association (and migration if needed)
such that posts belong to a user and `user.posts` retrieves all of a User's posts.
*NOTE*: Make sure that if you run a migration, you commit the updated `db/schema.rb`.

You'll need to manually add some test users and posts to the database from the rails console (`rails c`).
This is because the forms in the web app **don't** have a field for the user_id.

2. Read the [Rails Routing Guide chapters 1 and 2][routing] and modify `config/routes.rb`
so that `rake routes` generates the following routing table:

```
        Prefix Verb   URI Pattern                              Controller#Action
    user_posts GET    /users/:user_id/posts(.:format)          posts#index
               POST   /users/:user_id/posts(.:format)          posts#create
 new_user_post GET    /users/:user_id/posts/new(.:format)      posts#new
edit_user_post GET    /users/:user_id/posts/:id/edit(.:format) posts#edit
     user_post GET    /users/:user_id/posts/:id(.:format)      posts#show
               PATCH  /users/:user_id/posts/:id(.:format)      posts#update
               PUT    /users/:user_id/posts/:id(.:format)      posts#update
               DELETE /users/:user_id/posts/:id(.:format)      posts#destroy
         users GET    /users(.:format)                         users#index
```

3. The web app won't support creating posts with the new routes since
the user_id doesn't get set on new posts are created. Modify the `create` method
on the posts controller to also support the user_id.

*HINT*: It has to do with the "parameters" the method is allowed to take. Look at the
post_params method in the PostsController. What do you think it does?

## BONUS!

Add `show` and `post` methods to the users controller that, respectively,
show and create a user. You'll need to modify `config/routes.rb` for the routes
and add some views in app/views/users/.

Feel free to only support JSON or HTML, not both. If you attempt this read the
[Action Controller Guide chapter on Parameters][params], paying special attention
to section 4.5 and referring to the posts controller for an example.

[rails-cli]: http://guides.rubyonrails.org/command_line.html
[params]: http://guides.rubyonrails.org/action_controller_overview.html#parameters
[routing]: http://guides.rubyonrails.org/routing.html
