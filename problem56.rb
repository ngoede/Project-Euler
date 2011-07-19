def digital_sum(n)
	return n if n < 10
	return n % 10 + digital_sum(n / 10)
end

def max_pow(n)
 (1..100).max_by {|b| p n ** b;digital_sum(n**b) }
end

p max_pow 99
#puts (99.upto(99).max_by {|a|  } })