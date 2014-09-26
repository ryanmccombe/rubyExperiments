##
# Finish the solution so that it sorts the passed in array of numbers.
# If the function passes in an empty array or null/nil value then it should return an empty array.

def solution(nums)
  valid = nums.is_a?(Array) && nums.all? {|i| i.is_a? Fixnum }
  valid ? nums.sort() : []
end

puts solution([1, 2, 10, 50, 5]) # should return [1,2,5,10,50]
puts solution(nil) # should return []
puts solution2([1,2,"Banana"]) # should return []