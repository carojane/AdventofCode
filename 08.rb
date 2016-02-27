def day08
  def strip(lines)
    total2 = 0
    lines.each do |l|
      l.chop!.gsub!(/^\"/, "")
      l.gsub!(/\\\"|(\\){2}|(\\x)(\w){2}/, "A")
      total2 += l.length
    end
    total2
  end

  def add(lines)
    lines2 = []
    total3 = 0
    lines.each do |l|
      l.gsub!(/(["\\])/, '\\\\\1')
      line = "\"#{l}\""
      total3 += line.length
    end
    total3
  end

  f = File.open("./day8input.txt")
  lines = []
  f.each do |line|
    line.chomp!
    lines << line
  end

  total1 = 0
  lines.each {|l| total1 += l.length}
  answer1 = (total1 - strip(lines)).to_s

  f = File.open("./day8input.txt")
  lines = []
  f.each do |line|
    line.chomp!
    lines << line
  end

  answer2 = (add(lines) - total1).to_s

  [answer1,answer2]
end
