# Complete the solution so that it takes an array of keys and a default
# value and returns a hash with all keys set to the default value.

def solution(keys, default_value)
  output = {}
  keys.each do |key|
    output[key] = default_value
  end
  output
end

def solution2(keys, default_value)
  Hash[keys.map { |key| [key, default_value] }]
end