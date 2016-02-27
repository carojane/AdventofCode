f = File.open("./day3input.txt")
array = f.read.split("")

x = 0
y = 0
houses = [[x,y]]

array.each do |a|
	x += 1 if a == "^"
	x -= 1 if a == "v"
	y += 1 if a == ">"
	y -= 1 if a == "<"
	houses << [x, y]
end

puts "03.a: " + houses.uniq!.count.to_s

x = 0
y = 0
rx = 0
ry = 0
houses = [[x,y]]
houses_with_robo = [[x,y]]

array.each_with_index do |a, index|
	if index % 2 == 0
		x += 1 if a == "^"
		x -= 1 if a == "v"
		y += 1 if a == ">"
		y -= 1 if a == "<"
		houses_with_robo << [x, y]
	else
		rx += 1 if a == "^"
		rx -= 1 if a == "v"
		ry += 1 if a == ">"
		ry -= 1 if a == "<"
		houses_with_robo << [rx, ry]
	end
end
puts "03.b: " + houses_with_robo.uniq!.count.to_s
