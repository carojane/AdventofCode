require 'json'

def day12
  def total(data)
    numbers = data.scan(/-?\d+/)
    total = 0
    numbers.each {|x| total += x.to_i }
    total.to_s
  end

  def eval_hash(hash)
    total = 0
    if !hash.has_value?("red")
      hash.each do |k,v|
        total += eval_hash(v) if v.is_a?(Hash)
        total += eval_array(v) if v.is_a?(Array)
        total += v if v.is_a?(Integer)
      end
    end
    total
  end

  def eval_array(array)
    total = 0
    array.each do |v|
      total += eval_hash(v) if v.is_a?(Hash)
      total += eval_array(v) if v.is_a?(Array)
      total += v if v.is_a?(Integer)
    end
    total
  end

  data = File.read("./day12input.txt")
  data2 = JSON.parse(data)

  [total(data),eval_hash(data2).to_s]
end
