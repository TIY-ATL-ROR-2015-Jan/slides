## Homework Questions

1. Where should I put my API key?

  * Simpler: `ETSY_API_TOKEN=kjahsdlkfjhkjahsdifhj rails s`
    In your controller: `ETSY_API_TOKEN = ENV['ETSY_API_TOKEN']`
    Heroku likes to do things this way.

  * *Complicated!*
    Put a ruby file in `config/initializers`.
    Fill it with a random key_val: `ETSY_API_TOKEN = 'FOOBARFOOBARFOOBAR'`
    Commit it, add it to .gitignore.
    Then change it to your real key.

2. Where does my CSS go?

  * `app/assets/stylesheets/application.css`
  * It gets included by the layouts/application.html.erb
  * You shouldn't have to think about this.
  * Maybe partial views for header and footer are reasonable.
    * [partials part 1](http://guides.rubyonrails.org/layouts_and_rendering.html#using-partials)
    * [partials part 2](http://guides.rubyonrails.org/action_view_overview.html#partials)
  * But I don't care cause this is a single view app.

3. What the hell is with form_for?

  * **My fault**: `form_for(user_posts_path(@post.user, @post)) do |f| ... `
  * `link_to` / `redirect_to`. Which are different than `form_for`
  * I was trying to emphasize different kinds of "path things":
    * sometimes we have an object: `redirect_to @post`
    * sometimes we have multiple objects: `link_to [@user, @post]`
    * sometimes we have explicit paths: `user_posts_path(@post.user, @post)`

  * `form_for` should **only** be used when we care about saving the result
    of the form *in the database*. i.e. when we're creating / editing a model.
    see: [when to use form_for](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-form_for-label-Resource-oriented+style)

  * That is, use `form_for` when you can hand it:
    1. **ALL** the objects it needs to build the route `(@user, @post)` for a
       route with two variables `:user_id` and `:id`
    2. You have the actual model objects you're trying to edit. (It's okay if
       you have two objects for the path but you're only editing one of them.)

  * If we're not, we should use [`form_tag`](forms)

  [forms]: http://guides.rubyonrails.org/form_helpers.html#a-generic-search-form

4. What are our reasonable ways to get data from the users? And route them!

  * If we just need to send a user to a route (GET or DELETE) and
    *DO NOT NEED INPUT*, we can use `link_to` / an `<a href>` tag.
  * Otherwise, for PATCH/POST or when we *need* input in a get (like a search box)
    we **must** use a <form>. That should use `form_tag` if we're not saving it
    in the database (like a search box), but otherwise probably use `form_for`.

5. Why are the edit and new routes GET requests?
   A: Because we need to send the form down as HTML, *then*
   the submit on the form can send data back up to another endpoint.
   Hence having new paired with create, edit paired with update.

6. The Etsy gem docs are confusing. WAT! Options:
   1. `Etsy::Listing.find_all_active_by_category('whiskey', :includes => ['Images',
      'Shop']` but this still returns weird results sometimes.
   2. `Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'],
      :keywords => 'whiskey')` seems to return good results.
      But we need JSON.parse the body. Then you have a hash. Good to go!
   **NOTE**: You have to set your API key first! `Etsy.api_key = 'foo'`

## Rails / Betterblog Stuff

### One day...
