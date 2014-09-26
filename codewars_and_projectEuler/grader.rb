##
# Create a function that takes a number as an argument and returns a grade based on that number.
# Anything greater than 1 or less than 0.6 should return "F"
# 0.9 or greater should return the grade "A"
# 0.8 or greater should return the grade "B"
# 0.7 or greater should return the grade "C"
# 0.6 or greater should return the grade "D"

def grader(score)
  return "F" if score > 1 || score < 0.6
  return "A" if score >= 0.9
  return "B" if score >= 0.8
  return "C" if score >= 0.7
  return "D" if score >= 0.6
end

def grader2(score)
  case score
    when 0.6...0.7 then "D"
    when 0.7...0.8 then "C"
    when 0.8...0.9 then "B"
    when 0.9..1 then "A"
    else "F"
  end
end

puts grader(0.9) == "A"
puts grader(0.3) == "F"
puts grader(234) == "F"
puts grader(0.75) == "C"