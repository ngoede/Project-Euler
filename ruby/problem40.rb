s = (1..10_000_000).inject("") {|result, x| result << x.to_s }
puts [1, 10, 100, 1000, 10_000, 100_000, 1_000_000].map {|i| i - 1}.map {|i| s[i..i].to_i }.reduce(:*)