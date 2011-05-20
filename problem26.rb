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

def brent(x0)
  power = lam = 1
  tortoise = x0
  hare = division(x0)
  while(tortoise != hare)
    if power == lam then
      tortoise = hare
      power *= 2
      lam = 0
    end
    hare = division(hare)
    lam += 1
  end
  
  mu = 0
  torotise = hare = x0
  (1..lam).each do |i|
    hare = division(hare)
  end
  while tortoise != hare
    tortoise = division(tortoise)
    hare = division(hare)
    mu += 1
  end
  [lam, mu]
end

p brent(DivisionValue.new 7, 0, 1)