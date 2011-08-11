def sqrt2(perm)
  1 + frac_part(perm)
end

def frac_part(perm)
  if perm == 1 then 
    1.to_r / 2.to_r
  else
    1.to_r / (2.to_r + frac_part(perm - 1))
  end
end

def number_of_digits n
  n.to_s.length  
end

def greater_num_digits
    (1..1000).select do |n|
    result = sqrt2 n
    number_of_digits(result.numerator) > number_of_digits(result.denominator)
  end
end

puts greater_num_digits.length