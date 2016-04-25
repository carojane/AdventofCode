combos = []
(0..100).each do |a|
  (0..100).each do |b|
    (0..100).each do |c|
      d = 100 - (a+b+c)
      combos << [a,b,c,d] if d > -1
    end
  end
end

print combos
puts combos.count
