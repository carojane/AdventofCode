paper = 0
ribbon = 0
source = []
source_array = []
source_string = ""

f = File.open("./day2input.txt")
source_ary = f.read.split("\n")
source_ary.each {|s| source << s.split("x").map(&:to_i)}

source.each do |a|
	a.sort!
	sides = []
	sides << 2*a[0]*a[1]
	sides << 2*a[1]*a[2]
	sides << 2*a[2]*a[0]
	paper += sides.inject(:+)
	paper += sides.min/2
	ribbon += 2*a[0]+2*a[1]
	ribbon += a[0]*a[1]*a[2]
end

puts "2.a: " + paper.to_s
puts "2.b: " + ribbon.to_s
