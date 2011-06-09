require "./util"
require "set"

def longest_prime_sum primes, is_prime
  result = 0
  max = 0
  (0..primes.length).each do |x|
    break if primes.length - x < max
    (1...(primes.length - x)).each do |i|
      break if primes.length - x - i + 1 < max
      sum = primes[x..-i].reduce(:+)
      length = primes[x..-i].length
      if length > max and is_prime.include?(sum) then
        result = sum
        max = length
        break
      end
    end
  end
  return result, max
end

primes = Util.get_primes 1_000_000
is_prime = Set.new primes

puts longest_prime_sum primes, is_prime