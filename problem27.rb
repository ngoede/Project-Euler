require 'rubygems'
require 'memoize'
include Memoize

def is_prime(n)
  return false if n % 2 == 0
  min = 3
  max = Math.sqrt(n)
  min.step(max, 2) {|x| return false if n % x == 0}
  return true
end

memoize :is_prime

max_n = 0
a_max = 0
b_max = 0

(-100000...100000).each do |a|
  (-100000...100000).each do |b|
    (0...300).each do |n|
      break if !is_prime((n**2 + a * n + b).abs)
      if max_n < n
        puts max_n
        max_n = n
        a_max = a
        b_max = b
      end
    end 
  end
end

puts max_n
puts a_max
puts b_max