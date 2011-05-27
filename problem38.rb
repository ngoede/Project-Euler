class Integer
	def number_of_digits
		return 1 if self == 0
		Math.log10(self).floor + 1
	end
	
	def pandigital?(size)
		self.to_s.chars.to_a.uniq.length == size
	end
end

max_pand = 0
test_range = 1..10000000
test_range.each do |num|
	number_of_digits_left = 9
	i = 1
	pand = 0
	until number_of_digits_left <= 0
		next_num = num * i
		number_of_digits_left -= next_num.number_of_digits
		pand = (pand * 10 ** next_num.number_of_digits) + next_num
		i += 1
	end
	max_pand = pand if pand.number_of_digits == 9 and pand.pandigital?(9) and pand > max_pand
end
puts max_pand
	