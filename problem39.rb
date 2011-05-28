def right_tri_for_p(p)
	max_search = p / 2
	results = []
	(1..max_search).each do |a|
		(1..max_search).each do |b|
			c = p - a - b
			results << [a, b, c] if a < b and b < c and a**2 + b**2 == c**2
		end
	end
	results
end

max_p = (1..1000).max_by {|p| right_tri_for_p(p).length }
puts max_p
p right_tri_for_p(max_p)