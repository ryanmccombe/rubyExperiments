# Provides retrieval and processing of guesses

class Guess
  def initialize; end

  def get_input
    gets.chomp
  end

  # Filter exit / new commands
  def handle_input
    input = get_input
    if input == 'exit'
      $end = true
      true
    elsif input == 'new'
      $turn = 0
      random_code
      true
    elsif validate(input.split(""))
      process(input.split(""))
      true
    else
      print "Bad input!  Try again;"
      false
    end
  end

  # If input is not a command, verify it's a valid guess
  def validate(guess)
    return true if guess.length==4 && guess.all?{ |i| (1..6).include?(i.to_i) }
    false
  end

  # Process guess - How many correct answers?
  def process(guess)
    code = [$code[0],$code[1],$code[2],$code[3]]
    guess = guess.map{ |i| i.to_i }

    correct_place = 0
    (0..3).each do |i|
      if guess[i] == code[i]
        correct_place+=1
        guess[i], code[i] = nil
      end
    end

    correct_number = 0
    (0..3).each do |i|
      index = code.index(guess[i])
      if !(guess[i].nil?) && index
        guess[i],code[index] = nil
        correct_number += 1
      end
    end

    wrong_number=guess.select{|i| !(i.nil?)}.length

    $guess = [correct_place, correct_number, wrong_number]
  end
end