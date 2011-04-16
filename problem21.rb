require 'rubygems'
require 'memoize'
include Memoize

def f(x)
  results = []
  (1..x/2).each {|i| results << i if x % i == 0 }
  return results
end

def sum(list)
  list.inject(0) {|sum, i| sum + i}
end

def d(x)
  sum(f(x))
end

memoize :d

results = {}
(1...10000).each do |x|
  puts "at " + x.to_s if x % 100 == 0
  d_x = d(x)
  (1...10000).each do |y|
    if(x != y and d_x == y and d(y) == x)
      results[x] = x if !results.has_key?(x)
      results[y] = y if !results.has_key?(y)
    end
  end
end

results.values.each {|x| puts x}
puts sum(results.values)
