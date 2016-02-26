require 'pry'
def parse(l)
  l = l.split(" ")
  line = [l[0],l[2],l[4].to_i]
end

routes = []
stops = []

f = File.open("./day9input.txt")
f.each do |l|
  line = parse(l)
  stops << line[0]
  stops << line[1]
  routes << [line[0],line[1],line[2]]
end

count = stops.uniq!.count
all = stops.permutation.to_a
final = []

all.each do |a|
  path = [[],0]
  x = 0
    while x < 7
      start = a[x+0]
      stop = a[x+1]
      path[0] << start if path[0][-1] != start
      path[0] << stop
      ind = routes.index { |r| r.include?(start) && r.include?(stop) }
      path[1] += routes[ind][2]
      x += 1
    end
  final << path
end

fares = []
final.each {|f| fares << f[1]}

puts "9.a: #{fares.min}"
puts "9.b: #{fares.max}"
