digits = (0..9).map {|x| x.to_s}
p digits
(10 ** 6 - 1).times do 
	k = -1
	for i in 0...(digits.length - 1)
		k = i if digits[i] < digits[i + 1]
	end
	break if k == -1
	
	l = -1
	for i in k...digits.length
		l = i if digits[k] < digits[i]
	end
	
	temp = digits[k]
	digits[k] = digits[l]
	digits[l] = temp
	
	digits = digits[0..k] + digits[(k + 1)..digits.length].reverse
end
p digits