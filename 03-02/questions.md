# todo-mvc

## Description

I'm proud of y'all. You've worked very hard and
learned a ton this semester. This will be our
last homework project. You're gonna nail it. :)

Build an implementation of [TodoMVC][todomvc]
using Rails and jQuery. This is an individual
project!

[todomvc]: http://todomvc.com/

## Due Date

Thursday, March the 5th before the start of class.

## Objectives

### Learning Objective

After completing this assignment, you should ...

* Be able to build a "full-stack" CRUD app by yourself!
  Database/Controllers/Views/CSS/JS, the works!
* Know how to use Rails "Unobtrusive Javascript" to create a single-page AJAX app.
* Know how to use event handlers and callbacks to respond to click events, etc.

### Performance Objectives
* Be able to update DOM elements with jQuery.
* Be able to update CSS classes dynamically with jQuery.
* Be able to use Rails `respond_to ... format.js` to send javascript to the browser.

## Details

### Deliverables

* A repo with your Rails app.
  Running the app should start a server with
  the features described below:

#### Normal Mode

* Users can create accounts and login.
* User homepage shows their todos.
  Whether it requires login is your call.
* Todos can be added, renamed, marked complete,
  and deleted.
* There are buttons to toggle todo completion
  and delete todos. They are inline with the
  todo item.
* There should be a Todo count on the page.
* All todo operations besides editing can be
  performed without a page reload!

#### Hard Mode
* Inline editing of todos when you double
  click them. It shouldn't need a page refresh.
* Instead of using Rails views/`render` in your
  foo.js.erb templates, use [Underscore.js][_js]!
* Add a button to clear/delete all todos
  marked complete. The count should get updated.
* Todos have a due date. UI toggle for display
  of overdue todos, extra CSS styling.
  Consider using [jQueryUI][jquery-ui] for the
  calendar/datepicker. This will require you
  to add the jQueryUI javascript library to
  your app.

## Suggested Schedule

Monday:
* Basic support for users and todos.
* Just use Rails, no fancy jQuery yet.
* Creating and deleting todos at minimum.

If you finish that:
* Support marking a todo finished or
  unfinished and toggling display of
  unfinished todos in the UI.
* Maybe go ahead and get AJAX creation
  and deletion of todos working.
  See the [built-in helpers][helpers].

Tuesday:
* Finish support for marking todos completed
  and toggling display of unfinished todos in UI.
* Get AJAX creation and deletion support working.
* Switching between All todos, Finished todos,
  and Unfinished todos in the UI with AJAX.
  No page reload!
* Add bootstrap CSS framework, start styling.

Wednesday:
* Buttons to delete or mark a todo done/undone.
* CSS classes should be updated as necessary.
* If you have time, do "inline" AJAX editing
  when the user double clicks on a todo.

## Resources

* General articles:
  * [Working with Javascript in Rails][rails-js]
  * [A tour of Rails Jquery-UJS][ujs-tour]
  * [Basics of Javascript and jQuery][js-fundamentals]

[rails-js]: http://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html
[ujs-tour]: https://robots.thoughtbot.com/a-tour-of-rails-jquery-ujs
[js-fundamentals]: http://jqfundamentals.com/

* Specific tools/libraries:
  * [jQuery][jquery]
  * [DOM events][events]
  * [Underscore][_js]
  * [jQuery UI][jquery-ui]

[_js]: http://underscorejs.com/
[jquery]: http://api.jquery.com
[events]: http://www.w3schools.com/jsref/dom_obj_event.asp
[jquery-ui]: http://jqueryui.com/
[helpers]: http://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html#built-in-helpers

## Questions?

Ask them! :)
