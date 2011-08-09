def digital_sum(n)
	return n if n < 10
	return n % 10 + digital_sum(n / 10)
end

def max_pow(n)
  max = 0
	(1..100).each do |b|
	  current = digital_sum(n**b)
		max = current if current > max
	end
	max
end

max = 0

1.upto(99).each do |n|
	current = max_pow n
	max = current if current > max
end

puts max