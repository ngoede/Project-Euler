Coins = [1, 2, 5, 10, 20, 50, 100, 200]

def change(total, denoms)
	return 1 if total == 0
	return 0 if total < 0
	return 0 if denoms <= 0 && total >= 1
	
	change(total, denoms - 1) + change(total - Coins[denoms - 1], denoms)
end

puts change(200, Coins.count)