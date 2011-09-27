require "./util"
require "set"

def find_permuted_primes
  four_digit_primes = Util.get_primes(9999).select {|i| i >= 1000 }
  prime_check_set = Set.new four_digit_primes
  results = []
  four_digit_primes.each do |i|
    permutations = set_of_3 permute(i, prime_check_set)
    results << permutations if not permutations.nil?
  end
  return results
end

def permute n, prime_check_set
  digits = n.to_s.chars.map {|s| s.to_i }.to_a
  permutations = digits.permutation(4).map{|d| d.join.to_i }
  prime_permutations = permutations.select {|d| prime_check_set.include? d }
  prime_permutations
end

def set_of_3 permutations
  permutations.uniq.permutation(3).each do |nums|
    return nums if nums[1] - nums[0] == nums[2] - nums[1]
  end
  nil
end

p find_permuted_primes.map {|nums| nums.sort }.uniq