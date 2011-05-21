require 'set'

class CoinState
	@@already_explored = Set.new
	CoinValues = [1, 2, 5, 10, 20, 50, 100, 200]

	def initialize(coinStates)
		@coin = coinStates
		@@already_explored.add coinStates
	end
	
	def get_next
		possible_values = (0...8).map do |x|
			result = Array.new(@coin)
			result[x] += 1
			result
		end
		possible = possible_values.reject {|x| @@already_explored.include? x}.map {|x| CoinState.new x }
		possible.select {|x| x.value <= 200 }
	end
	
	def value
		@coin.zip(CoinValues).map {|x| x.reduce(:*) }.reduce(:+)
	end
end


class Problem
	attr_reader :results

	def initialize
		@results = []
	end
	
	def solve(states_to_test)
		states_to_test.each do |s|
			next_states = s.get_next
			@results += next_states.select {|x| x.value == 200 }
			solve(next_states.select {|x| x.value < 200 })
		end
	end
end

p = Problem.new
p.solve([CoinState.new([0, 0, 0, 0, 0, 0, 0, 0])])
puts p.results.count