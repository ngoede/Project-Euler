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
  less_primes = $prime_nums.take_while {|p| p <= Math.sqrt(n)}
  divisors = [1]
  less_primes.each do |x|
    if n % x == 0 then
      divisors << x
      i = n / x
      while (n % i) == 0 and i >= x
        divisors << i
        divisors << n / i
        i = i / x
      end
    end
  end
  divisors | less_primes.combination(2).map {|i| i[0] * i[1]}.find_all {|x| n % x == 0}
end

def abundant?(n)
  divisors(n).reduce(:+) > n
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