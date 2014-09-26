##
# Your task is to convert strings to how they would be written by Jaden Smith.
# The strings are actual quotes from Jaden Smith, but they are not capitalized in the same way he originally typed them.
# Not Jaden-Cased: "How can mirrors be real if our eyes aren't real"
# Jaden-Cased:     "How Can Mirrors Be Real If Our Eyes Aren't Real"
class String
  def toJadenCase
    self.split().map(&:capitalize).join(' ')
  # self.split().map{|word| word.capitalize}.join(' ')  # full syntax (same result)
  end
end

puts "How can mirrors be real if our eyes aren't real".toJadenCase