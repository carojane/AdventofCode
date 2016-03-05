require 'colorize'
require 'pry'
correct = File.read("./answers.txt").split(/\n/)
number_correct = 0
total = 0
answer = ""

(1..25).each do |n|
  n = n.to_s
  n = "0"+n if n.length == 1

  file = n + ".rb"
  method = "day" + n

  break if !File.exist? file

  require_relative file
  a = send(method)

  ans = ""
  (0..1).each do |x|
    ans = a[x]
    line = (2*n.to_i)-2+x
      if correct[line] == ans
        print "*".yellow
        number_correct += 1
      else
        print "*".red
      end
    ans.red if !correct[line] == ans
    answer += n + (x == 0 ? ".a: " : ".b: ") + ans + "\n"
  end

  puts "\nFinished!" if n == 25

  total += 2
end

puts "\n"
puts number_correct.to_s + "/" + total.to_s + " Correct Answers"
puts "\n"
puts "Answers:\n" + answer



