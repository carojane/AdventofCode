require 'pry'

def day03
	source = File.read("./day3input.txt").split("")

  def move(c,a)
  	x = c[0]
  	y = c[1]
    x += 1 if a == "^"
    x -= 1 if a == "v"
    y += 1 if a == ">"
    y -= 1 if a == "<"
    [x,y]
  end

	def test_a(array)
		cords = [0,0]
		houses = [cords]

		array.each do |a|
			cords = move(cords,a)
			houses << cords
		end

		houses.uniq!.count.to_s
	end

	def test_b(array)
		cords = [0,0]
		rcords = [0,0]
		houses_with_robo = [cords]

		array.each_with_index do |a, index|
			if index % 2 == 0
				cords = move(cords,a)
				houses_with_robo << cords
			else
				rcords = move(rcords,a)
				houses_with_robo << rcords
			end
		end

		houses_with_robo.uniq!.count.to_s
	end

	[test_a(source), test_b(source)]
end
