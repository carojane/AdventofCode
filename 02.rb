def day02
  paper = 0
  ribbon = 0
  source = []

  File.foreach("./day2input.txt") do |l|
    source << l.split("x").map(&:to_i)
  end

  source.each do |a|
  	a.sort!
  	sides = a.combination(2).to_a
    sides.map! {|x| x.reduce(:*) *2}
  	paper += sides.reduce(:+) + sides.min/2
  	ribbon += 2*a[0]+2*a[1] + a.reduce(:*)
  end

  return [paper.to_s, ribbon.to_s]
end
