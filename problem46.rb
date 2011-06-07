require 'set'

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

def sum_of_prime_and_square?(n, primes)
	#Assumes increasing list of primes
	 primes.take_while { |p| p < n }.map {|t| n - t }.any? { |x| x.even? and two_times_square? x }
end

def two_times_square? t
  (Math.sqrt(t / 2).floor ** 2) * 2 == t
end
	
primes = get_primes(10_000)

prime_set = SortedSet.new primes
max = primes[-1] + 2
test_set = SortedSet.new((3..max).step(2)) - prime_set
p test_set.find {|n| !sum_of_prime_and_square? n, prime_set}
