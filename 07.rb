def day07
  def solve(x)
    if x[0] == "NOT"
      (~ x[1])
    elsif x[1] == "OR"
      (x[0] | x[2])
    elsif x[1] == "AND"
      (x[0] & x[2])
    elsif x[1] == "RSHIFT"
      (x[0] >> x[2])
    else
      (x[0] << x[2])
    end
  end

  def iterate(directions)
    directions.each {|key,value| value.map! {|v| (v =~ /\d+/) ? v.to_i : v}}
    while !directions["a"][0].is_a?(Integer)
      directions.each do |key,value|
          if value.count == 1 && value[0].is_a?(Integer)
            directions.each do |k,v|
              v.map! { |e| (e == key) ? value[0] : e}
            end
          elsif value[1].is_a?(Integer)
              directions[key] = [solve(value)]
          elsif value[0].is_a?(Integer) && value[2].is_a?(Integer)
              directions[key] = [solve(value)]
          else
          end
      end
    end
    directions
  end

  directions = {}
  directions2 = {}

  File.foreach("./day7input.txt") do |l|
    d = l.chomp.split(" -> ")
    d[0] = d[0].split(" ")
    directions[d[1]] = d[0]
  end

  File.foreach("./day7input.txt") do |l|
    d = l.chomp.split(" -> ")
    d[0] = d[0].split(" ")
    directions2[d[1]] = d[0]
  end

  directions = iterate(directions)
  answer1 = directions["a"]
  directions2["b"] = answer1
  directions2 = iterate(directions2)

  [directions["a"][0].to_s, directions2["a"][0].to_s]
end
