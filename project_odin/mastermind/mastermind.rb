require_relative "guess.rb"

# Provides game logic and process
class Game
  def initialize
    random_code
    $turn = 1
    $end = false
    @guess = Guess.new
  end

  def random_code
    code = Array.new(4)
    $code = code.map{rand(1..6)}
  end

  # Main loop
  def play
    until $end
      turn
    end
  end

  # What is displayed at launch?
  def intro
    puts "Welcome to Ruby Mastermind!"
    puts "The computer has generated a code"
  # puts "Debug: #{$code.inspect}"
    print "Make your first guess:"
  end

  # Steps of a turn
  def turn
    intro if $turn == 1
    until @guess.handle_input; end
    response($guess) unless $end
    $turn += 1
  end

  # Respond to guess
  def response(results)
    if results[0] == 4
      puts "You broke the code in #{$turn} turn#{$turn == 1 ? "" : "s"}!"
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

end

game = Game.new
game.play
