fiblist :: (Num a) => Int -> [a] -> [a]
fiblist 0 _ = [0]
fiblist 1 _ = [1, 0]
fiblist a [] = fiblist a [1, 0]
fiblist a all@(n1:n2:_)
	| length all == a	= all
	| otherwise			= fiblist a ((n1 + n2):all)

problem2 = sum [x | x <- fiblist 1000 [], x <= 4000000, x `mod` 2 == 0]

 