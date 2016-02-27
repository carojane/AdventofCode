def day11
  def main(word)
    alph
    @word = word
    # old_password
    next_letter(-1)
    next_letter(-1) while !rules
    @word
  end

  def alph
    @alph = [*("a".."z")].join
    @alph.delete!("i").delete!("l").delete!("o")
  end

  def old_password
    print "Enter your old password: "
    input = gets.chomp!
    @word = input
    if is_valid?
      next_letter(-1)
    else
      puts "Invalid Password"
      old_password
    end
  end

  def next_letter(x)
    l = @word[x]
    i = @alph.index(l)
    if !last_letter?(l)
      @word[x] = @alph[i+1]
    else
      first_letter(x)
    end
  end

  def last_letter?(l)
    l == @alph[-1]
  end

  def first_letter(x)
    @word[x] = @alph[0]
    if @word[x-1]
      next_letter(x-1)
    else
      @word = @alph[0] * 8
    end
  end

  def is_valid?
    @word.match(/\A([a-z]){8}\z/) != nil
  end

  def rules
    straight && repeating
  end

  def straight
    straight = false
    alph = @alph.split("")
    alph[0...-2].each_with_index do |a, i|
      straight = @word.include?(a + @alph[i+1] + @alph[i+2])
      break if straight
    end
    straight
  end

  def repeating
    @word.scan(/(.)\1/).count > 1
  end

  input = "hxbxwxba"
  a = main(input)
  [a,main(a.clone)]
end
puts day11
