require './util'

def concat_to_num n1, n2
  (n1.to_s + n2.to_s).to_i
end

def all_prime?(nums)
	pairs = nums.permutation(2)
	pairs.all? do |pair|
      concat_to_num(pair[0], pair[1]).prime?
  end
end

def get_result
  Util::get_primes(1_000).combination(4) do |combo|
    return combo if all_prime? combo
  end

 #  primes = Util::get_primes(2_000)
 #  pairs = primes.combination(2).select do |combo|
 #  	all_prime? combo
 #  end
 #  threes = pairs.flatten.uniq.combination(3).select do |combo|
 #  	all_prime? combo
 #  end

	# pairs.each do |t|
	# 	threes.each do |p|
	# 		return t + p if t & p != p and all_prime?(t + p)
	# 	end
	# end

end

start = Time.new
p result = get_result
p result.count
#puts result.reduce(:+)
puts Time.new - start