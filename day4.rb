require 'digest/md5'

key = "ckczppom"
answer = 0
hash = ""

until hash.start_with?("00000")
  answer += 1
  puzzle = key + answer.to_s
  hash = Digest::MD5.hexdigest(puzzle)
end

answer2 = 0
hash = ""

until hash.start_with?("000000")
  answer2 += 1
  puzzle = key + answer2.to_s
  hash = Digest::MD5.hexdigest(puzzle)
end

puts "4.a: " + answer.to_s
puts "4.b: " + answer2.to_s
