module Util
  def get_primes n
    max_non_prime = Integer(Math.sqrt(n))
    primes = Array(2..n)
    primes.each do |p|
      if p > max_non_prime
      break
      end
      primes.delete_if { |x| x != p && x % p == 0 }
    end
    primes
  end
  module_function :get_primes

  class FactoringEngine
    def initialize(max_to_factor)
      @primes = Util.get_primes(Math.sqrt(max_to_factor).floor)
    end

    def factor(n)
      primes_to_test = @primes.take_while {|p| p <= n / 2}
      primes_to_test.find_all {|p| n % p == 0 }
    end
  end
end

class Integer
	def palendromic?
		self.to_s.reverse == self.to_s
	end
  
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

class SpiralCorners
  include Enumerable
  
  def initialize(n)
    @n = n
  end
  
  def each_with_side_length
    size_of_current = 3
    current = 1
    while size_of_current <= @n
      4.times { yield current += size_of_current - 1, size_of_current}
      size_of_current += 2
    end
  end
  
  def each()
    each_with_side_length {|c,l| yield c }
  end
    
end

class DictionaryOfCommonWords
  
  def initialize
    contents = ""
    File.open("words.txt") {|file| contents = file.read }
    
    contents.gsub!('"', '')
    @words = contents.split(",").map {|w| w.downcase }.to_a
  end

  def words
    @words
  end
end