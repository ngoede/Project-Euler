pandigitals = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].permutation(10).select {|p| p[3] % 2 == 0 && p[5] % 5 == 0 }.map {|n| n.map {|i| i.to_s }.reduce(:+).to_i}

def special? n
  n.to_s[1..3].to_i % 2 == 0 and
  n.to_s[2..4].to_i % 3 == 0 and
  n.to_s[3..5].to_i % 5 == 0 and
  n.to_s[4..6].to_i % 7 == 0 and
  n.to_s[5..7].to_i % 11 == 0 and
  n.to_s[6..8].to_i % 13 == 0 and
  n.to_s[7..9].to_i % 17 == 0
end

puts pandigitals.select {|n| special? n}.reduce(:+)
  
