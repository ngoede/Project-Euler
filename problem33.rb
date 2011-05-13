require "rational"

class Fixnum
  def split
    first, second = self / 10, self % 10
  end
end


def curious?(numerator, denominator)
  n1, n2 = numerator.split
  d1, d2 = denominator.split
  r = Rational(numerator, denominator)
  return false if r == 1 or n1 == 0 or n2 == 0 or d1 == 0 or d2 == 0
  (n1 == d2 and r == Rational(n2, d1)) or (n2 == d1 and r == Rational(n1, d2))
end

total = Rational(1, 1)
(10..99).each do |n|
  (10..99).each do |d|
    total *= Rational(n, d) if curious? n, d and n < d
  end
end

print total