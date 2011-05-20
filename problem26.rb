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
  tortoise = yield(x0)
  hare = yield(yield(x0))
  while tortoise != hare
    tortoise = yield(tortoise)
    hare = yield(yield(hare))
  end
  
  mu = 0
  hare = tortoise
  tortoise = x0
  while tortoise != hare
    tortoise = yield(tortoise)
    hare = yield(hare)
    mu += 1
  end
  
  lam = 1
  hare = yield(tortoise)
  while tortoise != hare
    hare = yield(hare)
    lam += 1
  end
  [lam, mu]
end

p (1..1000).map {|x| floyd(DivisionValue.new x, 0, 1) {|d| division d} << x }.max_by {|x| x[0] }