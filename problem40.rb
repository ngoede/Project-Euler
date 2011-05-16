s = (1..10_000_000).inject("") {|result, x| result << x.to_s }
puts s[0, 1].to_i * s[9, 1].to_i * s[99, 1].to_i * s[999, 1].to_i * s[9_999, 1].to_i * s[99_999, 1].to_i * s[999_999].to_i