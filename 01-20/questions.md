Fork the [guessr repo][guessr] and clone the fork to your laptop.

Don't forget to run `bundle` in your clone to pull in the dependencies/gems you need!

I will assign an issue to you on my guessr repo.
When you are done, post the link to your repo and close the issue.

[guessr]: https://github.com/TIY-ATL-ROR-2015-Jan/guessr

## Normal Mode

* Read the Rails guides for ...
  * [Migrations][migrations] (Chapters 1-3)
  * [Querying][querying] (Chapters 1-6)

[migrations]: http://guides.rubyonrails.org/active_record_migrations.html
[querying]: http://guides.rubyonrails.org/active_record_querying.html

* Add a NumberGuessingGame model and migration to the guessr project. It should go in the lib/guessr.rb file.
  * Get to the console / test migrations with `bundle exec camping -C lib/guessr.rb`
  * Experiment with the CRUD methods we talked about earlier today. Insert at least two models into the database. Close irb, then fire up the console again, retrieve the objects and update attributes for each of them.
