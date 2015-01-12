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
    puts error_msg
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
  return name, bday
end

students = {}

puts "Do we need to add another student? ('y' or 'n')"
another = gets.chomp
until another =~ /^n$/i
  if another =~ /^y$/i
    name, bday = add_student
    students[name] = {:bday => bday}
  end
  name, bday = add_students
  puts "You have to answer 'y' or 'n'."
  another = gets.chomp
end
