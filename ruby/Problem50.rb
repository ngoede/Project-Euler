require "./util"
require "set"

def create_sum_lookup primes
  sums = []
  primes.each_with_index do |p, i|
    sum = primes[0..i].reduce(:+)
    break if sum > 1_000_000
    sums << sum
  end
  return sums
end

def longest_prime_sum primes, is_prime
  sums = create_sum_lookup primes
  result = 0
  max = 0
  prime_length = sums.length
  (0..prime_length).each do |x|
    (1...(prime_length - x)).each do |i|
      length = prime_length - x - i + 1
      sum = sums[prime_length - i] - (x == 0 ? 0 : sums[x - 1] )
      if length > max and is_prime.include?(sum)
        result = sum
        max = length
        break
      end
    end
  end
  return result, max
end

now = Time.now
primes = Util.get_primes 1_000_000
p Time.now - now
is_prime = Set.new primes

puts longest_prime_sum primes, is_prime