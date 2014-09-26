##
# Complete the solution. It should try to retrieve the value of the array at the index provided.
# If the index is out of the array's max bounds then it should return the default value instead.

def solution(items, index, default_value)
  items.length >= index.abs ? items[index] : default_value
end

def solution2(items, index, default_value)
  items.fetch(index, default_value)
end

data = ['a', 'b', 'c']
puts solution(data, 1, 'd') # should == 'b'
puts solution(data, 5, 'd') # should == 'd'

# negative values work as long as they aren't out of the length bounds
puts solution(data, -1, 'd') # should == 'c'
puts solution(data, -5, 'd') # should == 'd'
