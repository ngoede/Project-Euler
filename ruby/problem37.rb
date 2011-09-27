require 'set'

class Problem37
	def initialize n
		@primes = Set.new(get_primes(n))
	end

	def left_truncate_prime? n
		return true if n == 0
		return @primes.include?(n) && left_truncate_prime?(chop_first_num n)
	end
	
	def right_truncate_prime? n
		return true if n == 0
		return @primes.include?(n) && right_truncate_prime?(n / 10)
	end
	
	def chop_first_num n
		n.to_s[1..-1].to_i
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
end

problem = Problem37.new 1_000_000
truncates = []
p (11..1_000_000).select {|n| problem.left_truncate_prime?(n) && problem.right_truncate_prime?(n) }.reduce(:+)

