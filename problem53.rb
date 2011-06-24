class Integer
  def factorial
    self.downto(1).reduce(:*)
  end
end

def c n, r
  n.factorial / (r.factorial * (n - r).factorial)
end

p (1..100).map {|n| (1...n).count {|r| c(n, r) > 1_000_000}}.reduce(:+)