# Write a function that accepts an array of 10 integers (between 0 and 9), that returns a string of those numbers in the form of a phone number.
# Example: createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) => returns "(123) 456-7890"
# The returned format must be correct in order to complete this challenge.
# Don't forget the space after the closing parenthese!

def create_phone_number(numbers)
  "(%d%d%d) %d%d%d-%d%d%d%d" % numbers
end

#  str % arg → new_str
#  Uses str as a format specification, and returns the result of applying it to arg.
#  If the format specification contains more than one substitution, then arg must be an Array or Hash containing the values to be substituted.