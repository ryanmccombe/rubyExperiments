class Game
  def initialize
    random_code
    $turn = 1
    $end = false
  end

  def random_code
    code = Array.new(4)
    $code = code.map{rand(1..6)}
  end

  def play
    until $end
      turn
    end
  end

  def intro
    puts "Welcome to Ruby Mastermind!"
    puts "The computer has generated a code"
    puts "Debug: #{$code.inspect}"
    print "Input your first guess:"
  end

  def turn
    intro if $turn == 1
    until handle_input; end
    response(@guess) unless $end
    $turn += 1
  end

  def response(results)
    if results[0] == 4
      puts "You broke the code in #{$turn} turns!"
      $end = true
    elsif $turn == 8
      puts "Out of Guesses!  The code was #{$code.inspect}"
      $end = true
    else
      print "Correct Place: #{results[0]} | "
      print "Correct Colour: #{results[1]} | "
      puts "Incorrect Colour: #{results[2]}"
      print "You have #{8-$turn} turn#{$turn == 7 ? "" : "s"} left: "
    end
  end

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

  def get_input
    gets.chomp
  end

  def validate(guess)
    return true if guess.length==4 && guess.all?{ |i| (1..6).include?(i.to_i) }
    false
  end

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

    @guess = [correct_place, correct_number, wrong_number]
  end

end

game = Game.new
game.play
