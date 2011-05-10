class SpiralCorners
  include Enumerable
  
  def initialize(n)
    @n = n
  end

  def each()
    size_of_current = 3
    current = 1
    while size_of_current <= @n
      4.times { yield current += size_of_current - 1}
      size_of_current += 2
    end
  end
end

br = []
bl = []
ul = []
ur = []

SpiralCorners.new(1001).each_slice(4) do |x|
  br << x[0]
  bl << x[1]
  ul << x[2]
  ur << x[3]
end

puts br.reduce(:+) + bl.reduce(:+) + ul.reduce(:+) + ur.reduce(:+) + 1
