first = 1
second = 1
count = 2
while(second < (10**999))
  temp = first
  first = second
  second = temp + first
  count += 1
end

puts second
puts first
puts count
puts second.to_s.length
puts first.to_s.length