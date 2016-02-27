require 'digest/md5'

key = "ckczppom"
hash = ""
answer = ""
answer2 = ""

(1..99999999999).each do |i|
  hash = Digest::MD5.hexdigest(key + i.to_s)
  answer = i.to_s if hash.start_with?("00000")
  if hash.start_with?("000000")
    answer2 = i.to_s
    break
  end
end

puts "04.a: " + answer
puts "04.b: " + answer2
