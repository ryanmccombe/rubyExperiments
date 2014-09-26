class Student
  attr_accessor :first_name, :last_name, :primary_phone_number

  def introduction(target)
    puts "Hi #{target}, I'm #{first_name}!"
  end

  def favourite_number(n)
    if n%2 == 0
      "even number #{n}"
    else
      "odd number #{n}"
    end
  end
end

frank=Student.new
frank.first_name="Frank"
puts "Frank's favourite number is #{frank.favourite_number(4)}."
frank.introduction("Ryan")

class Object
  def is_number?
    self.to_f.to_s == self.to_s || self.to_i.to_s == self.to_s
  end
end

puts "Give number!"

number = gets.chomp()
if number.is_number?
  puts (number.to_i() + 1).to_s + " is bigger!"
else
  puts number.to_s + " isn't a number you monster!"
end