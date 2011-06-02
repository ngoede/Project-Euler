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
	test_primes = primes.take_while { |p| p < n }
	test_primes.map {|t| n - t }.any? {|t| two_times_square? t }
end
	
primes = get_prime(1000)

