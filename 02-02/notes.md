## Step 1: Let's do some homework review.

* Who wants to present their solution?
* Who has something they struggled with?




















## Step 2: Time to do Rails things!

* gem install rails && rbenv rehash`

Lots of [rails command line things][rails-cli]
[rails-cli]: http://guides.rubyonrails.org/command_line.html

Gonna write a blog app from scratch. Again. But rails now.
So many commands:

* rails new betterblog
* rails s / rails c

Let's add posts:
* rails g scaffold Post title body:text
( omg what the hell just happened ... )

Rails g (for generate) writes your code for you. Multiple levels:
* model: model and migration
* resource: model, migration, controller (empty), and routes
* scaffold: model, migration, controller (w/ methods), routes, and views!

Let's migrate and play with it in rails server for a second.
Now let's look at the routes file and `rake routes`.
* __Important__ to emphasize connection between routes, path helpers, and controllers.

Wouldn't hurt to clean up app/views/posts/show.html.erb ... (see scratch buffer)
Now, let's make the index.html.erb pretty too.

Hmm, duplication? Don't repeat yourself, right? Time for a partial!
* app/views/posts/_post.html.erb  /  render :partial => @post/@posts

## Step 3: Couple Directions to Go. We should *branch*.

### Options:

1. Add date
Whoops, forgot to have date.
* rails g migration AddDateToPosts date:datetime
* `rake db:migrate`

2. Add JSON endpoints!
* The magic of `respond_to`

3. Add some comments!
Hmm, blogs aren't very interesting without comments. Let's add comments!
* rails g resource Comment post:references body:text
* `rake db:migrate`
* Add associations
* Fix routes to make comments under posts. Also, only need create, delete.

4. Add tagging!
Ya know, our old blog at least had some notion of tags. Let's add tags!
* rails g model Tag name:string
* rails g model PostTag post:references tag:references
* Add associations through :post_tags

5. Add some auth / user model
Oops, anyone can write or delete posts. That's not great.
Let's add a user model and basic auth! # TODO/maybe?
* rails g resource User username:string password:string
* The magic of `authenticate_or_request_with_http_basic`
