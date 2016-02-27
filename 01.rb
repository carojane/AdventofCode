def day01
  floor = 0
  basement = []
  source = File.read("./day1input.txt").split("")

  source.each_with_index do |p, index|
    p == "(" ? floor += 1 : floor -= 1
    basement << index+1 if floor == -1
  end

  return [floor.to_s, basement[0].to_s]
end
