require 'pry'

def day05
  def naughty(string)
    ["ab", "cd", "pq", "xy"].any? {|s| string.include?(s)}
  end

  def vowel(string)
    string.scan(/[aeiou]/).count >= 3
  end

  def double_letters (string)
    string.scan(/([a-z])\1/).count > 0
  end

  def couplets (string)
    array = string.split("")
    pairs = []
    count = 0

    array.each_with_index do |a, i|
      pairs << a + array[i+1] if array[i+1]
    end

    pairs.each_with_index do |p, i|
      pairs.each_with_index do |pp, ii|
        if ii == i || ii == i+1 || ii == i-1
        else
          count += 1 if p == pp
        end
      end
    end

    count > 0
  end

  def polk (string)
    s = string.split("")
    s.each_index do |i|
      return true if s[i] == s[i+2]
    end
    false
  end

  nice1 = 0
  nice2 = 0
  File.foreach("./day5input.txt") do |line|
    nice1 += 1 if (!naughty(line) && vowel(line) && double_letters(line))
    nice2 += 1 if (couplets(line) && polk(line))
  end
  [nice1.to_s,nice2.to_s]
end
