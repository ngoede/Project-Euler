require './util'

def four_digits_and_no_third_zero? n
  n >= 1000 and n.to_s[2] != '0'
end

triangles = []
Util::triangle_numbers_til(10000) {|t| triangles = triangles << t}
p triangles.select {|t| four_digits_and_no_third_zero? t }

triangles = []
Util::triangle_numbers_til(10000) {|t| triangles = triangles << t}
p triangles.select {|t| four_digits_and_no_third_zero? t }

triangles = []
Util::triangle_numbers_til(10000) {|t| triangles = triangles << t}
p triangles.select {|t| four_digits_and_no_third_zero? t }

triangles = []
Util::triangle_numbers_til(10000) {|t| triangles = triangles << t}
p triangles.select {|t| four_digits_and_no_third_zero? t }

triangles = []
Util::triangle_numbers_til(10000) {|t| triangles = triangles << t}
p triangles.select {|t| four_digits_and_no_third_zero? t }

