def day10
  input = 1113222113

  def look_say(input, time)
    array = input.to_s.split("")
    new_number = []

    array.each_with_index do |x, i|
      count = 1
      if x != array[i-1] || i == 0
          while x == array[i+count]
            count += 1
          end
        new_number << count.to_s + x
      end
    end

    number = new_number.join
    time -= 1

    if time == 0
      return number
    else
      look_say(number, time)
    end
  end

  [look_say(input, 40).length.to_s, look_say(input, 50).length.to_s]
end
