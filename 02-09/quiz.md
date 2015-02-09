# QUIZ TIME!

Fill this out and send the result to `brit@theironyard.com`.
You have until 9:15. This is for practice, not for a grade.

## Section 1 - Models / Associations

```
class Post < ActiveRecord::Base
  has_many :comments
end
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
end
```

1. Assuming we had a Comment variable named `talk`, what would `talk.user.posts.first.destroy` do?

2. Assuming we had a hash like `toy = {:user_id => 28, :text => 'Profound wisdom.'}`, what would
   `Post.find_by(title: "New Years Resolution").comments.create(toy)` do?

## Section 2 - Controllers / Routing

1. What controller and method does a request matching `put '/posts/:id', to: 'posts#update'` go to?

2. What three things cause input to be placed into `params`?

## Section 3 - Views / HTML-isms

1. What are the two ways (i.e. HTML tags) that make HTTP requests/send data?

2. If we call `render :new` in the PostsController, what template under 'app/views' does it look for?
   (Note: 'new.html.erb' is not a sufficient answer, think about the path.)
