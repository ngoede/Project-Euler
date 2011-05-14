def palendromic10?(n)
	n.to_s.reverse == n.to_s
end

def palendromic2?(n)
  n.to_s(2).reverse == n.to_s(2)
end

puts (1..1_000_000).step(2).find_all {|n| palendromic10?(n) && palendromic2?(n)}.reduce(:+)