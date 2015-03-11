## Lecture Notes

## A High-Level View of Testing

* Tests are just ruby code.
* The important question is what to test.
  This depends on you and the team you work with.
  Not a universal right answer!
      (But we'll talk about some guidelines)

## Why Test?

To increase confidence when adding or changing code!

* Upsides:
  * An easy way for newcomers on a project to know they "did it right".
  * Makes large rewrites/refactorings much less crazy/scary.
* Downsides:
  * If the requirements change, have to fix the code *and* the tests.
  * Tests can be wrong/have bugs too.

## What Kinds of Tests/Testing are there?

* Unit Tests
* Integration/Acceptance Tests

**But more importantly!!** There is a spectrum between
fast tests that are small and usually simpler to write (unit tests)
and slow tests that are bigger and more complicated (integration tests).

Some companies don't care about tests.

The ones that do usually fall into one of two categories (IME):

* COVERAGE COVERAGE COVERAGE! (many unit tests, few integration tests)
* A few tests for the really important things. (This resonates with me)

## What to test?

**No single right answer.**

But generally, when the code is brittle or tricky or
it took you a long time to write/debug it or you just
don't trust it.

## What not to test?

* Ruby
* Rails
* Libraries

We try to take "built-in" things for granted.

## How should you approach testing?

* BDD (Behavior Driven Development)
* TDD (Test Driven Development)
* DDD (Documentation Driven Development, my fav?)
* WTFYWDD (Whatever-the-fuck-you-want Driven Development)

Basically a question of two things:

1. Who writes the tests?
2. Do the tests come before or after the code?

### Special helpers for:

* Testing Models
* Testing Controllers & Routes

### Why do we want:

* Mocking/Stubbing    (rspec-mocks)
* Factories/Fixtures  (FactoryGirl)
* Browser interaction (Capybara)
