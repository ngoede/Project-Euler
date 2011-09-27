require "./util"
require "set"

def replace_digits number, indexs_to_replace, x
  number_s = number.to_s
  indexs_to_replace.each {|i| number_s[i] = x.to_s }
  number_s.to_i
end

number_of_digits = 6
max_index = number_of_digits - 1
indexes = (0..max_index).flat_map {|n| (0..max_index).to_a.combination(n + 1).to_a }
primes_to_test = Util.get_primes(999_999).select {|i| i > 99999}

prime_set = Set.new primes_to_test

def get_result primes_to_test, indexes, prime_set
  results = primes_to_test.map do |p|
    indexes.map do |i|
      possibles = (0..9).map do |n|
        replace_digits(p, i, n)
      end
      primes = possibles.select {|x| prime_set.include? x}
      return primes[0] if primes.count == 8
    end
  end
end

p get_result primes_to_test, indexes, prime_set
  