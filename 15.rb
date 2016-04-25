require 'pry'

def day15
  ingredients = Hash.new
  File.foreach("day15input.txt") do |l|
    l = l.split(/[: ,\n]+/)
    ingred = Hash.new
    (1..5).each do |n|
      ingred[l[(2*n)-1]] = l[2*n].to_i
    end
    ingredients[l[0]] = ingred
  end

  greds = ingredients.keys
  combos = greds.permutation(greds.count).to_a
  properties = ["capacity", "durability", "flavor", "texture"]

  totals = []

  # percentage = []
  # (0..100).each do |a|
  #   (0..100-a).each do |b|
  #     (0..100-a-b).each do |c|
  #       d = 100 - (a+b+c)
  #       percentage << [a,b,c,d] if d > -1
  #     end
  #   end
  # end

  # combos.each do |combo|
  #   percentage.each do |per|
  #         total = []
  #         properties.each do |p|
  #           prop_total = 0
  #           combo.each_with_index do |c,i|
  #             prop_total += ingredients[c][p] * per[i] if ingredients[c][p] > 0
  #           end
  #           total << prop_total
  #         end
  #         totals << [combo,total.inject(:*)] if total.inject(:*) > 0
  #   end
  # end

  # total = []
  # totals.select {|x| total << x[1]}
  # puts total.max

  ["NOT DONE","NOT DONE"]
end

day15
