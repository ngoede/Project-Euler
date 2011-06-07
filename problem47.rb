require "./util"
require "set"

def find_first_n_with_n_factors(number_of_factors)
  factor = Util::FactoringEngine.new(10000)
  factors_used = Set.new
  (1..10_000).each_cons(number_of_factors).find {|nums| nums.all? {|x| n_distinct?(x, number_of_factors, factors_used, factor) } }
end

def n_distinct? x, number_of_factors, factors_used, factorizer
  factors = factorizer.factor(x)

end

puts .factor(646)