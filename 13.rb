def day13
  def max_hap(guests)
    count = guests.count
    settings = guests.permutation(count).to_a
    happiness = []
    settings.each do |set|
      total_happiness = 0
      set.each_with_index do |person, i|
        neighbors = []
        i == 0 ? neighbors << set[-1] : neighbors << set[i-1]
        i == count-1 ? neighbors << set[0] : neighbors << set[i+1]
        neighbors.each do |n|
          hap = []
          if n != "me" && person != "me"
            @chart[person].select {|x| hap = [x[0],x[1]] if x.include?(n+".")}
            if hap[0] == "gain"
              total_happiness += hap[1].to_i
            else
              total_happiness -= hap[1].to_i
            end
          end
        end
      end
      happiness << total_happiness
    end
    happiness.max.to_s
  end

  @chart = {}
  guests = []
  File.foreach("day13input.txt") do |l|
    l = l.split(" ")
    @chart[l[0]] = [] if !@chart[l[0]]
    @chart[l[0]] << [l[2],l[3],l[-1]]
    guests << l[0]
  end

  guests.uniq!
  without_me = max_hap(guests)
  guests << "me"
  with_me = max_hap(guests)

  [without_me, with_me]
end
