def day06
  directions = []
  File.foreach("./day6input.txt") do |line|
    l = line.split(/\W/)
    l.delete "turn"
    x_cords = ((l[1].to_i)..(l[4].to_i)).to_a
    y_cords = ((l[2].to_i)..(l[5].to_i)).to_a
    coordinates = x_cords.product(y_cords)
    directions << [coordinates,l[0]]
  end

  def answer1(directions)
    lights = Array.new(1000) {Array.new(1000,"off")}
    directions.each do |l|
      l[0].each do |c|
        x = c[0]
        y = c[1]

        if l[1] == "on"
          lights[x][y] = "on"
        elsif l[1] == "off"
          lights[x][y] = "off"
        else
          if lights[x][y] == "on"
            lights[x][y] = "off"
          else
            lights[x][y] = "on"
          end
        end
      end
    end

    count = 0
    lights.each {|l| count += l.count("on")}
    count.to_s
  end

  def answer2(directions)
    light_bright = Array.new(1000) {Array.new(1000,0)}
    brightness = 0
    directions.each do |l|
      l[0].each do |c|
        x = c[0]
        y = c[1]

        if l[1] == "on"
          light_bright[x][y] += 1
        elsif l[1] == "off"
          light_bright[x][y] -= 1 if light_bright[x][y] > 0
        else
          light_bright[x][y] += 2
        end
      end
    end

    light_bright.each {|l| l.each {|a| brightness += a}}
    brightness.to_s
  end
  [answer1(directions),answer2(directions)]
end
