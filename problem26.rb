class DivisionValue
  attr :denominator
  attr :digit
  attr :remainder
  
  def initialize(denom, digit, remain)
    @denominator = denom
    @digit = digit
    @remainder = remain
  end
  
  def ==(other)
    other != nil &&
    self.denominator == other.denominator &&
    self.digit == other.digit &&
    self.remainder == other.remainder
  end
end

def division(value)
  whole = value.remainder / value.denominator
  accounted = whole * value.denominator
  remain = value.remainder - accounted
  DivisionValue.new(value.denominator, whole, remain * 10)
end

def floyd(x0)
  tortoise = division(x0)
  hare = division(division(x0))
  while tortoise != hare
    tortoise = division(tortoise)
    hare = division(division(hare))
  end
  
  mu = 0
  hare = tortoise
  tortoise = x0
  while tortoise != hare
    tortoise = division(tortoise)
    hare = division(hare)
    mu += 1
  end
  
  lam = 1
  hare = division(tortoise)
  while tortoise != hare
    hare = division(hare)
    lam += 1
  end
  [lam, mu]
end

p (1..1000).map {|x| floyd(DivisionValue.new x, 0, 1) << x }.max_by {|x| x[0] }