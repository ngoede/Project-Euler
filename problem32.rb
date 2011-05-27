digits = (1..9).to_a
products = []
digits.permutation(9) do |num|
	(0..3).each do |i|
		a = num[0..i].join.to_i
		b = num[(i + 1)...-4].join.to_i
		product = num[-4..-1].join.to_i
		products << product if a * b == product
	end
end
puts products.uniq.reduce(:+)