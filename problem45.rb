class Integer
	def pentagonal?
		n = (Math.sqrt(24 * self + 1) + 1) / 6
		n.floor == n
	end
	
	def hexagonal?
		n = 1/4 * (Math.sqrt(8 * self + 1) + 1)
		n.floor == n
	end
end

class HexagonalNumbers
	include Enumerable

	def initialize start_at
		@start = start_at
	end
	
	def each
		n = @start
		while true
			n += 1
			yield n * (2 * n - 1)
		end
	end
end

puts HexagonalNumbers.new(143).find {|n| n.pentagonal? }