require './util.rb'
require 'set'
#require 'mathn'

class Integer
  def prime?
    return false if self == 1
	return true if self < 4
	return false if (self % 2) == 0
	return true if self < 9
	return false if (self % 3) == 0
	
	r = Math::sqrt(self).to_i
	f = 5
	while f <= r
	  return false if self % f == 0
	  return false if self % (f + 2) == 0
	  f = f + 6
	end
	return true
  end
end

corners = SpiralCorners.new 1_000_000

n = 0.0
p = 0.0

now = Time.new
corners.each_with_side_length do |c, length|
  n += 1.0
  p += 1.0 if c.prime?
  if(p / n <= 0.1) then
    puts length
    break
  end
end
puts Time.new - now