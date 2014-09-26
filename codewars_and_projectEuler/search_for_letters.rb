##
# String search
# Create a method to accept one arbitrary string as an argument, and return a string of length 26.
# The objective is to detect if letters of the alphabet (upper or lower case) are present anywhere in the string,
# and to set each of the 26 characters corresponding to each letter to either '1' if present, '0' if not.
# So if an 'a' or an 'A' appears anywhere in the argument string (any number of times), set the first character of the
# returned string to '1' otherwise to '0', if 'b' or 'B' the the second to '1', and so on for the rest of the alphabet.
# For instance
#   change('a   **&  bZ') =>  '11000000000000000000000001'

# by mapped array and join
def change input
  if input.is_a?(String)
    ("A".."Z").map do |letter|
      input.upcase.include?(letter) ? '1' : '0'
    end.join
  end
end

# by string append
def change2 input
  if input.is_a?(String)
    output = ""
    ("A".."Z").each do |letter|
      input.upcase.include?(letter) ? output << "1" : output << "0"
    end
  end
  output
end

puts change('a   **&  bZ') ==  '11000000000000000000000001'
puts change("Hello")
puts change("Ab") == "11000000000000000000000000"
puts change([])
puts change(nil)