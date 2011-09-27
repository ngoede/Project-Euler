def pentagonal n
  n * (3 * n - 1) / 2
end

def pentagonal? x
  n = (Math.sqrt(24 * x + 1) + 1) / 6
  n.floor == n
end

min_diff = 100_000_000
(1..10000).each do |j|
  ((j+1)..10000).each do |k|
    sum = pentagonal(j) + pentagonal(k)
    diff = pentagonal(k) - pentagonal(j)
    min_diff = diff if diff < min_diff and pentagonal? sum and pentagonal? diff
  end
end

puts min_diff