text = <<EOF
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
EOF

short_text = <<EOF
3
7 4
2 4 6
8 5 9 3
EOF

class Node
  attr_reader :value
  attr_reader :left
  attr_reader :right
  
  NumberToLookAhead = 3
  
  def initialize	(value, y, x, raw)
    @value = value
    if raw.length - 1 > y then
      @left = Node.new(raw[y+1][x], y + 1, x, raw)
      @right = Node.new(raw[y+1][x+1], y + 1, x + 1, raw)
    end
  end
  
  def max
    score_right = right.nil? ? 0 : right.look_ahead(NumberToLookAhead)
    score_left = left.nil? ? 0 : left.look_ahead(NumberToLookAhead)
    left_max = left.max unless left.nil? or score_right > score_left
    right_max = right.max unless right.nil? or score_left > score_right
    [value + (left_max || 0), value + (right_max || 0)].max
  end
  
  def look_ahead(n)
    return value if n == 0 or left.nil? or right.nil?
    [value + left.look_ahead(n - 1), value + right.look_ahead(n -1)].max
  end
end

values = text.map {|x| x.split(' ').map {|i| i.to_i} }
node = Node.new(values[0][0], 0, 0, values)
puts node.max