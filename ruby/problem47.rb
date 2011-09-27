require "./util"
require "set"

MAX = 500_000
def find_first_n_with_n_factors(number_of_factors)
  factor = Util::FactoringEngine.new(MAX)
  
  (1..MAX).each_cons(number_of_factors).
    find do |nums|
      nums.all? {|x| n_distinct?(x, number_of_factors, factor) } 
    end
end

def n_distinct? x, number_of_factors, factorizer
  factors = factorizer.factor(x)
  factors.length == number_of_factors
end

factor = Util::FactoringEngine.new(10000)

puts find_first_n_with_n_factors 4