class Integer
	def number_of_digits
		return 1 if self == 0
		Math.log10(self).floor + 1
	end
	
	def pandigital?(size)
		num_digits = self.to_s.chars.to_a.uniq.map {|i| i.to_i }
		num_digits.all? {|i| (1..size).to_a.include? i } and num_digits.count == size
	end
end

max_pand = 0
test_range = [9] + (91..98).to_a + (912..987).to_a + (9123..9876).to_a
test_range.each do |num|
	i = 1
	pand = 0
	until pand.number_of_digits >= 9
		next_num = num * i
		pand = (pand * 10 ** next_num.number_of_digits) + next_num
		i += 1
	end
	max_pand = pand if pand.number_of_digits == 9 and pand.pandigital?(9) and pand > max_pand and i > 1
end
puts max_pand
	