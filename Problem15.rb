MaxCord = 20
$count = 0
def increase_cordinates(x, y)
  if(x == MaxCord && y == MaxCord)
    $count += 1
  end
  
  increase_cordinates(x + 1, y) if(x < MaxCord) 
  increase_cordinates(x, y + 1) if(y < MaxCord)
end

def increase_cordinates_iter
  (1..MaxCord).each do |x|
    (1..MaxCord).each do |y|
      $count += y + x
    end
  end
end

def p(r, c) 
  f(r)/(f(c) * f(r - c))
end

def f(i)
  if(i == 1 or i == 0) 
    return 1
  end
  return i * f(i - 1)
end

print p(2 * MaxCord, MaxCord)