pandigitals = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].permutation(10)
	.select {|p| p[3] % 2 == 0 && p[5] % 5 == 0 }.map {|n| n.map {|i| i.to_s }.reduce(:+).to_i}

p pandigitals.length
