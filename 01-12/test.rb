require 'pry'

def bar(x)
  # TODO: Let's play with .id / .object_id in here...
  puts 'setting something inside X works here'
  x[0] = 5
  puts "x is a #{defined?(x)}"
  # binding.pry
  x = [4, 3, 2, 1]
  puts 'but not setting X itself? WAT!'
end

def baz(x)
  puts 'can we push on to X?'
  x.push 5
  puts 'sure we can'
end

def quux(x)
  x.reverse
end

def foo
  test = (1..4).to_a
  puts "#{test}"

  puts "\nENTERING BAR\n"
  bar(test)
  puts "AFTER bar: #{test}"

  puts "\nENTERING BAZ\n"
  baz(test)
  puts "AFTER baz: #{test}"

  puts "The *Right* Way:"
  test = quux(test)
  puts "AFTER quux: #{test}"
end

foo
