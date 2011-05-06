primes = [2]
(3..28123).each {|x| primes << x if !primes.any? {|i| x % i == 0}}
primes = [1] + primes
p primes
puts "Computed primes..."

def divisors(n, primes)
  less_primes = primes.take_while {|x| x < n}
  prime_divisors = less_primes.find_all {|i| (n % i) == 0 }
  prime_divisors.map {|x| n / x } + prime_divisors
end

def abundant?(n, primes)
  divs = divisors(n, primes)
  sum = divs.reduce(:+) - n
  sum > n
end

abundant = (2..28123).find_all {|i| abundant?(i, primes)}
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
puts ((1..28123).to_a - sum_of_abundant).inject {|i, sum| i + sum}