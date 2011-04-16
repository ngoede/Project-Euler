require 'date'
date = Date.civil(1901, 1, 1)
count = 0
until date > Date.civil(2000, 12, 31)
  count += 1 if date.mday == 1 and date.wday == 0
  date += 1
end
print count