## Can we do songsearch better?

YES! With javascript. :)

We'll get the Spotify data with AJAX requests and shove it directly onto the page! They even have an [example][search-ex] of how to do this!

To do this we'll create [event][events] handlers with [jQuery][$]!
The jQuery methods we'll use are primarily [ready][ready], [on][on], and
[the selector function (i.e. $("#foo")][selector].

[ready]: http://api.jquery.com/ready/
[on]: http://api.jquery.com/on/
[selector]: http://api.jquery.com/jQuery/#jQuery1

When the user picks a song *then* we'll make a new
request to Rails to add something to the database.

I went ahead and added a route and controller and messy view to the
betterblog project. I know I keep just adding things in there. Bear with me!

* https://github.com/tiy-atl-js-q1-2015/Notes/blob/master/Week%2003/Tuesday.md
* https://github.com/tiy-atl-js-q1-2015/Notes/blob/master/Week%2004/Monday.md
* https://github.com/tiy-atl-js-q1-2015/Notes/blob/master/Week%2004/Wednesday.md

[search-ex]: http://jsfiddle.net/JMPerez/0u0v7e1b/
[events]: http://www.w3schools.com/jsref/dom_obj_event.asp
[$]: http://jquery.com/

## Part 3: JS App Architecture / The Module Pattern

So, Brian asked yesterday, do we just put all our javascript code in one file
or what? It's a great question. You can break your code up among multiple
files as you like, but one important thing about javascript is that it doesn't
have **Modules** built-in by default like Ruby. So that means there is *no*
namespacing. This has profound scoping implications. As a result, in javascript
you "fake" modules through the use of functions. Shit's about to get weird ...

**Insane discussion of function objects, higher-order functions, etc ensues here**

The Lisper / Functional Programmer in me loves this. We can do fucking *anything*
with just functions and (something close to) "lexical scope"! Closures, ya'll!

Of course, in Ruby we don't really need to. But anyway, okay. Module pattern.

I.e. Your application.js defines a module.
    All your other js files add properties to that module!
    (And you'll probably wind up tweaking the load order/manifest files by hand.

Eloquent Javascript is an excellent book on JS (and programming, generally)
written by the inimitable Marijn Haverbeke. It's available free online and there
is a solid chapter about the module pattern. If you read it, you will become smarter. :)

[The Module Pattern](http://eloquentjavascript.net/10_modules.html)

## Resources

[Eloquent Javascript](http://eloquentjavascript.net)
[Mastering the Module Pattern](http://toddmotto.com/mastering-the-module-pattern/)
