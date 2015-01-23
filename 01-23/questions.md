# Weekend Assignment

Build a basic terminal todo app. I've provided most of the application skeleton in [toodoo][toodoo].
You'll want to fork and clone it and push all work to your fork.

## Git Note!

If you cloned your copy before I finished writing all the TODOs...
You should run the following commands in your fork:

1. git remote add upstream git://github.com/TIY-ATL-ROR-2015-Jan/toodoo.git
2. git pull upstream master

## Installing / Running / Databases / Migrating

First, four important notes:

1. **Installing:** To get the dependencies you will need to run `bundle` after you clone.

2. **Running:** Since we're not using camping there's no magic to the app startup.
   E.g. Things don't happen in a weird order if you `binding.pry`.

   That said, you need to run the code with bundle exec so the `require "foo"`
   statements know what directories to look in for dependencies.
   This means you should run the app like this: `bundle exec ruby lib/toodoo.rb`.

3. **Databases:** The database is [configured][db_config] and will be stored in `db/toodoo.db`.
   There is a file that sets up the database connection anytime you start the app.
   We didn't explicitly cover it in class but it's actually quite simple.
   Feel free to [have a look][db_init].

4. **Migrating:** Migrations will work differently since we're not using camping.
   To write a migration, much like the [ActiveRecord Migration guide][migrations] says,
   you'll add a numbered file to the `db/migrate/` directory of the app with a class
   that inherits from `ActiveRecord::Migration` and `self.up` and `self.down` methods
   like you're used to. I have put in the [first migration][create_users] to create the `User` table.

   There is a "rake task" for running the migrations that you can call as follows:
   `rake db:migrate`. You may optionally pass it a `VERSION=001` argument that will
   migrate to the version specified. This should match your file numbering.
   We'll talk more about "rake tasks" at a later date, but if you're curious please
   have a quick peek at the [Rakefile][rakefile] and you'll there's no magic. :)

[toodoo]: https://github.com/TIY-ATL-ROR-2015-Jan.git
[db_config]: https://github.com/TIY-ATL-ROR-2015-Jan/toodoo/tree/master/config/database.yml
[db_init]: https://github.com/TIY-ATL-ROR-2015-Jan/toodoo/tree/master/lib/toodoo/init_db.rb
[migrations]: http://guides.rubyonrails.org/migrations.html
[create_users]: https://github.com/TIY-ATL-ROR-2015-Jan/toodoo/tree/master/db/migrate/001_create_users.rb
[rakefile]: https://github.com/TIY-ATL-ROR-2015-Jan/toodoo/tree/master/Rakefile

## Your Tasks

1. Add some kind of todo list model and todo item model. You will need one migration for each to create the tables.
   The todo list model needs very little, a user_id and a title should suffice. The todo item should have at least...
   * A todo_list_id
   * A name
   * A due date
   * Some sort of done/finished/completed marker

2. Once the tables and (empty) models are in place, you'll want to define any needed associations on the
   models like `has_one`, `has_many`, `belongs_to`, etc.

3. There are a list of methods with `TODO` comments in the ToDoApp class of `lib/toodoo.rb`.
   Read the **TODO** descriptions and implement the needed changes. As you do this, more and more of
   the app functionality will start working in the terminal UI. When you finish all the methods, you may
   embellish the UI and functionality however you like.

4. It is important that when a user deletes a todo list, all the todo items get deleted with it.
   Make sure that your models do this. Refer to the [ActiveRecord associations guide][associations] if needed.
   If a user deletes their account, the todo lists (and their items) should also be deleted.

[associations]: http://guides.rubyonrails.org/associations.html
