class Game
  require_relative "board.rb"
  def initialize
    @board = Board.new
    @turn = 1
    @player = rand(1..2)
    @tokens = [0, "X", "O"]
    @game_over = false
  end

  # What happens on turn 0
  def first_turn
    puts "Welcome to Ruby Tic Tac Toe!"
    puts "Player #{@player}(#{@tokens[@player]}) starts!"
    @board.render
    print "Enter a number from 1-9 to make your play: "
  end

  # Switch control to other player
  def switch
    @player == 1? @player = 2 : @player = 1
  end

  # What happens in a turn
  def turn
    if @turn==1
      first_turn
    else
      puts "Player #{@player}'s turn!"
      @board.render
      print "Place your #{@tokens[@player]}: "
    end

    play = gets.chomp
    if play.downcase == "exit"
      @game_over=true
      return nil
    end

    until @board.validate(play, @tokens[@player]); end

    game_over?
    switch
    @turn += 1
  end

  # Update game_over state
  def game_over?
    if @board.victory(@tokens[@player])
      @board.render
      puts "Player #{@player}(#{@tokens[@player]}) wins!"
      @game_over = true
    elsif @turn==9
      @board.render
      puts "Draw!"
      @game_over = true
    else
      false
    end
  end

  def play
    until @game_over
      turn
    end
  end

end

game = Game.new
game.play