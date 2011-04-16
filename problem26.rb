def cycle_len(i)
  count = 0
  while count < 20
    count += 2
    num_to_check = (10 ** count).to_f / i.to_f
    str = num_to_check.to_i.to_s
    puts str
    first_part = str[0, count / 2]
    second_part = str[count / 2 - 1, count / 2]
    puts first_part + " " + second_part
    return count / 2 if first_part == second_part
  end
end

# nums_to_check = (3...1000).find_all {|x| x % 2 != 0 and x % 5 != 0}
# max = 0
# nums_to_check.each {|x| max = cycle_len(x) if cycle_len(x) > max}
# puts max
puts cycle_len(6)

  