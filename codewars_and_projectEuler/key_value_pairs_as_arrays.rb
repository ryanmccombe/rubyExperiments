##
# Complete the keysAndValues function so that it takes in an object and returns the keys and values as separate arrays.
# Example:
# keysAndValues({a: 1, b: 2, c: 3}) # should return [[:a, :b, :c], [1, 2, 3]]

def keysAndValues(data)
  [data.keys, data.values]
end

puts keysAndValues({a: 1, b: 2, c: 3}) # should return [[:a, :b, :c], [1, 2, 3]]