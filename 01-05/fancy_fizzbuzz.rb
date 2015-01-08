def fizz_buzz (n)
  (1..n).each do |i|
    x = ''
    x += 'Fizz' if i % 3 == 0
    x += 'Buzz' if i % 5 == 0
    puts(x.empty? ? i : x)
  end
end

puts "got arguments: #{ARGV}"
puts "calling fizzbuzz with #{ARGV[0]}"

limit = ARGV[0].to_i
fizz_buzz(limit)
