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

def get_primes n
	max_non_prime = Integer(Math.sqrt(n))
	primes = Array(2..n)
	primes.each do |p|
	  if p > max_non_prime
		break
	  end
	  primes.delete_if { |x| x != p && x % p == 0 }
	end
	primes
end


puts get_primes(10_000_000).reverse.find {|p| p.pandigital? p.number_of_digits }