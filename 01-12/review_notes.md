## conditional constructs
* if / else / elsif / end (ternary too!)
* case
* unless
* when

conditional_thing (expression / test)
  do_stuff
end

ternary: expression ? do_stuff : else_stuff

# looping constructs
* loop / break

## do something with all the data
* for # ewwww gross
* each # yeaaaahhhh nailed it

## keep going as long as needed
* while
* until

## do something a certain number of times
* times

looping_construct (expression / test)
  do_loop_stuff
end

while user_is_typing
  if user_types('b')
    puts "you just bombed somebody."
  end
end

print 'bye now'


# User Input

def prompt_user(prompt, validator, error_msg)
  `clear`
  puts "\n#{prompt}\n"
  result = gets.chomp
  until result =~ validator
    puts "\n#{error_msg}\n"
    result = gets.chomp
  end
  puts
  result
end

def add_student
  name = prompt_user("What is your name?", /^[a-z ]*$/i,
                     "Letters and spaces only please!")
  bday = prompt_user("What is your birthday? (mm-dd-yy)",
                     /^[0-9]{2}-[0-9]{2}-[0-9]{2}/,
                     "Your birthday should be in \"mm-dd-yy\" format.")
  #movie = prompt_user("What is your favorite movie?")
  return name, bday #, movie
end

students = {}

while prompt_user("Do we need to add another student? ('y' or 'n')",
                  /^[yn]$/, "You have to answer 'y' or 'n'.") == 'y'
  name, bday = add_student
  students[name] = {:bday => bday}
end

## What about the sample method?
## (aka "Brit was doing it wrong")
# used the wrong version in hangman
# words.sample -> obj on rubydoc is better
# was using words.sample(n) -> new_array which is worse

## How does map work?
## Great question! Let's write one!
# Note: The following is PSEUDOCODE AND WILL NOT WORK IN YOUR RUBY.

# def my_map(array, $YOUR_BLOCK)
#   result = []
#   array.each { |x| result << $YOUR_BLOCK(x) }
#   result
# end

# Note: Read => as "ruby will return"
# toy = ['act', 'bed', 'cat]
# toy.each { |x| x.reverse } => nil
# toy.map { |x| x.reverse } => ['tca', 'deb', 'tac']
