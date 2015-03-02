## Last Week of Lecture!

I'd like to spend the first hour of class on general review,
maybe a quiz/homework questions. Then we can plow ahead
by recapping the Javascript we saw last week and looking at
more JS on a new project.

After this week, I will give 1 or 2 lectures a week on topics
of interest to the class. The rest of the time will be dedicated
to final projects. If anyone would like to research a topic and
_give_ a guest lecture to the class, come talk to me.

## Quiz Time!

You have until 9:35 (maybe 9:40) to finish this quiz and email it to `brit@theironyard.com`.

* http://goo.gl/MspRbD








## Finishing Up Our Spotify JS Search Page

Okay, let's review the code we have, modified from
[spotify's example][spotify-ex]. We can get data from Spotify,
no ruby required! Now how do we get it on the page.
We need a template/view!

Their example uses Handlebars. I'll convert it to underscore
for giggles and because I'm more familiar with underscore but
both are quite popular. Let's take a quick look at Handlebars.

As you can see, most libraries provide a bazillion features
and we usually care about approximately 4 of them. :)

[spotify-ex]: http://jsfiddle.net/JMPerez/0u0v7e1b/





## HTML5 Audio!

Okay, we've got the results displaying.
Let's add some CSS, get audio previews of albums working,
and continue to get a feel for frontend best practices.

## The Homework

The homework is (tentatively) a [TodoMVC][toomvc]
app written in Rails with just a bit of JS on the
frontend to make interaction nice.

[toomvc]: http://todomvc.com/

## Oh Man, Should We Use MVC?!?

As you can see, there are as many Javascript MVC frameworks
as there are kinds of bread at the grocery. I don't expect
we'll have time to cover them, though if y'all want I can
give a guest lecture on backbone in the last week or two.

The Todo apps on this site are *all* written in javascript.
They do not have a database backing them. They do not have
support for multiple users. But a Todo app is just big enough
to see how these frameworks help you structure JS.

Since we're using Rails and a database, we can get away
with much *less* javascript since all our app logic isn't
on the frontend. :)
