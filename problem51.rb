require "./util"

def replace_digits number, indexs_to_replace, x
  number_s = number.to_s
  indexs_to_replace.each {|i| number_s[i] = x.to_s }
  number_s.to_i
end

number_of_digits = 5
max_index = number_of_digits - 1
indexs = (0..max_index).flat_map {|n| (0..max_index).to_a.combination(n + 1).to_a }


  
  