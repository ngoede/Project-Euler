text = File.open("triangle.txt", "r").read

class Node
  attr_reader :value
  
  def left
    if @y >= (@raw.length - 1) then
      return nil
    end
    if @left.nil? then
      @left = Node.new(@raw[@y+1][@x], @y + 1, @x, @raw)
    end
    @left
  end
  
  def right
    if @y >= (@raw.length - 1) then
      return nil
    end
    
    if @right.nil? then
      @right = Node.new(@raw[@y+1][@x+1], @y + 1, @x + 1, @raw)
    end
    @right
  end
  
  NumberToLookAhead = 15
  
  def initialize	(value, y, x, raw)
    @y = y
    @x = x
    @raw = raw
    @value = value
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