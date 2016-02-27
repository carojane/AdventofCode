floor = 0
basement = []
source = File.read("./day1input.txt").split("")

source.each_with_index do |p, index|
  p == "(" ? floor += 1 : floor -= 1
  basement << index+1 if floor == -1
end

puts "01.a: " + floor.to_s
puts "01.b: " + basement[0].to_s
