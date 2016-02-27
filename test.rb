require 'pry'


directions = []
File.foreach("./day6input.txt") do |l|
  l = l.split(/\W/)
  l.delete "turn"
  directions << l
end

lights = Array.new(1000) {Array.new(1000,false)}

directions.each do |d|
  x1 = d[1].to_i
  x2 = d[4].to_i
  y1 = d[2].to_i
  y2 = d[5].to_i

  lights[x1..x2].each do |lit|
    lit[y1..y2].each do |l|
      if d[0] == "on"
        l = true
      elsif d[0] == "off"
        l = false
      else
        lit[y1..y2].each {|l| l = !l}
      end
    end
  end
end

  count = 0
  lights.each {|l| count += l.count("+")}
  puts count.to_s
binding.pry
