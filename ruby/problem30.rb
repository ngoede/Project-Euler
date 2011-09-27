def add_digits(num, pow)
  sum = 0
  until num <= 0
    sum += (num % 10) ** pow
    num = num / 10
  end
  return sum
end

results = (1...1000000).find_all do |i|
  add_digits(i, 5) == i
end

puts results.inject {|sum, i| sum + i}