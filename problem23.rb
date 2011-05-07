def primes(up_to)
  primes = []
  canidates = (2..up_to).to_a
  p = 0
  while p < Math.sqrt(up_to)
    p = canidates.shift
    primes << p
    canidates = canidates.select {|x| x % p != 0 }
  end
  
  primes + canidates
end

$prime_nums = primes 28123

def divisors(n)
  less_primes = $prime_nums.take_while {|p| p <= n / 2}.find_all {|x| n % x == 0}

  divisors = [1] + less_primes
  less_primes.each do |x|
    i = x ** 2
    while n % i == 0
      divisors << i
      i *= x
    end
  end
  multiple_divisors = []
  for i in 1...divisors.length + 1
      multiple_divisors += divisors.combination(i).map {|i| i.reduce(:*)}.find_all {|x| n % x == 0}
  end
  divisors | multiple_divisors
end

def abundant?(n)
  d = divisors(n)
  d.delete(n)
  d.reduce(:+) > n
end

abundant = (2..28123).find_all {|i| abundant?(i)}
puts "Found all abundant in range..."
sum_of_abundant = []
abundant.each do |x|
  abundant.each do |y|
    sum_of_abundant.push x + y
  end
end

puts "Sum of two abundant numbers found..."

puts abundant.length
puts sum_of_abundant.length
puts ((1..28123).to_a - sum_of_abundant).reduce(:+)