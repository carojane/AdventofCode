def day14
  directions = Hash.new
  score = Hash.new
  how_far = Hash.new
  File.foreach("day14input.txt") do |l|
    l = l.split(" ")
    directions[l[0]] = [l[3].to_i,l[6].to_i,l[-2].to_i]
    score[l[0]] = 0
    how_far[l[0]] = 0
  end

  distance = 2503
  raindeer_distance = []

  directions.each do |raindeer,stat|
    dist = 0
    speed = stat[0] * stat[1]
    extra = distance % (stat[1] + stat[2])
    times = distance / (stat[1] + stat[2])
    dist += speed * times
    if extra >= stat[1]
      dist += speed
    else
      dist += (stat[0] * extra)
    end
    raindeer_distance << dist
  end

  (1..distance).each do |sec|
    directions.each do |raindeer,stat|
      extra = sec % (stat[1] + stat[2])
      how_far[raindeer] += stat[0] if extra <= stat[1] && extra != 0
    end
    max = how_far.values.max

    winners = how_far.select {|k,v| v == max}
    winners.each {|k,v| score[k] += 1}

  end

  winner = score.values.max
  [raindeer_distance.max.to_s, winner.to_s]
end
