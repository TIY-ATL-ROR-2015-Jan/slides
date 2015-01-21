## Homework!

1. Read the following sections of the [ActiveRecord Associations guide][assoc]:

* 1
* 2.1, 2.2, 2.3, 2.4, 2.7
* 3.1, 3.2

[assoc]: http://guides.rubyonrails.org/association_basics.html

2. Get the stuffs you need.

* Fork and then clone my [blarg][blarg] repo from today's lecture.
* Then clone down a copy of [my blog][improvedmeans].
  NOTE: No need to fork it since we won't be making changes. You creepers.
* Run bundle in your blarg clone to make sure camping is set up.
  There is no need to "gem install blarg" or anything like that.
* Update the `BLOG_REPO` constant in lib/blarg.rb to the absolute path of my
blog clone on *your* system.

Okay. We're good to go now.

[blarg]: https://github.com/TIY-ATL-ROR-2015-Jan.git
[improvedmeans]: https://github.com/redline6561/improvedmeans.git

3. Import teh data.

First, start [camping][camping]. It will migrate the database to the latest version.
The command to use is `bundle exec camping -C lib/blarg.rb`.

Then, you'll be presented with a Ruby prompt if all goes well. Enter the following:

* `blog = BlogApp.new`
* `blog.run`

You'll be prompted about what to do, enter 2 to import posts, then enter 'all' to import all posts,
at the next screen. After the posts import, you can hit Control-C to break out of the while loop.

The data is now imported! :D
You can query it just as we did in class or as noted in the ActiveRecord [Querying][query] guide
via the model: `Blarg::Models::Post`

[query]: https://guides.rubyonrails.org/active_record_querying.html
[camping]: https://camping.io/

4. Write some code ya'll!

NOTE: Do not try to add a dedicated table for tags. We will do this in class tomorrow!

Think back to the [scoreboard][score] method from class...

* Add methods for the following to the bottom of lib/blarg.rb.
  * `top_tags`: A method that prints a sorted list of the top 10 most
      used tags in my blog along with a count of how many times they were used.
  * `top_months`: A method that prints a sorted list of the top 6 months
      ranked by number of posts.

BONUS: A method `top_words` that prints the 20 most commonly used words in my blog titles.

[score]: https://github.com/TIY-ATL-ROR-2015-Jan/guessr/blob/master/lib/guessr.rb#L164

All these methods should primarily query `Blarg::Models::Post`. The top_tags method
will require some extra work to iterate over the tags array that gets handed back.

HINT: The months method can be written purely using ActiveRecord query magic, no need
      to aggregate things into a hash as we did in class for scoreboard. You would need
      `.each` on the query to pass the final results to a block that `puts` them. :)
