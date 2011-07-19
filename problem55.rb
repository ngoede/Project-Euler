require './util'

class Integer
	def reverse
		self.to_s.reverse.to_i
	end
end

def iterate(n)
	n + n.reverse
end

lychrel = []
1.upto(10_000) do |n|
	current = n
	50.times do
		current = current + current.reverse
		break if current.palendromic?
	end
	lychrel << n unless current.palendromic?
end

p lychrel.count