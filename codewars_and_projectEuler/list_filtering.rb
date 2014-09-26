##
# In this kata you will create a function that takes a list of
# non-negative integers and strings and returns a new list with
# the strings filtered out.

def filter_list(list)
  list.reject { |i| i.is_a? String }
end

def filter_list2(list)
  list.select { |i| i.is_a? Fixnum }
end

puts filter_list([1,2,'a','b']) == [1,2]
puts filter_list([1,'a','b',0,15]) == [1,0,15]
puts filter_list([1,2,'aasf','1','123',123]) == [1,2,123]