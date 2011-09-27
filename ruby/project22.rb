def score(str)
  sum = 0
  str.each_byte {|c| sum += c - 64}
  return sum
end

names_str = File.open('names.txt').gets
names = names_str.gsub('"', '').split(',')
names.sort!()

sum = 0
names.each_with_index() {|name, index| sum += (index + 1) * score(name) }
puts sum