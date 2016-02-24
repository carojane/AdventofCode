floor = 0
basement = []
f = File.open("./day1input.txt")
source = f.read.split("")

source.each_with_index do |p, index|
if p == "("
floor += 1
else
floor -= 1
end
basement << index+1 if floor == -1
end

puts "1.a: " + floor.to_s
puts "1.b: " + basement[0].to_s
