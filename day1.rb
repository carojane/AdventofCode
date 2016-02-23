floor = 0
basement = []
source = ")())())"
array = source.split("")

array.each_with_index do |p, index|
if p == "("
floor += 1
else
floor -= 1
end
basement << index+1 if floor == -1
end

p floor
p basement[0]