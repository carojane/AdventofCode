require 'digest/md5'

key = "ckczppom"
hash = ""
answer = 0

(1..99999999999).each do |i|
  hash = Digest::MD5.hexdigest(key + i.to_s)

  if hash.start_with?("00000")
    answer = i
    break
  end
end

### WAY TOO SLOW!!! ###
# while !hash.start_with?("00000")
#   answer += 1
#   puzzle = key + answer.to_s
#   hash = Digest::MD5.hexdigest(puzzle)
# end

puts "4.a: " + answer.to_s

answer2 = 0
hash = ""

(1..99999999999).each do |i|
  hash = Digest::MD5.hexdigest(key + i.to_s)

  if hash.start_with?("000000")
    answer2 = i
    break
  end
end

### WAY TOO SLOW!!! ###
# while !hash.start_with?("000000")
#   answer2 += 1
#   puzzle = key + answer2.to_s
#   hash = Digest::MD5.hexdigest(puzzle)
# end

puts "4.b: " + answer2.to_s
