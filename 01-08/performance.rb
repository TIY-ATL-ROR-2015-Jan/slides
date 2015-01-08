# toy = [1, 2, 3, 4]

toy = (1..20).to_a

toy.combination(2) do |x1,x2|
  puts [x1,x2]
end
