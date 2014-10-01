class Game
  require_relative 'board'
  def initialize
    @board = Board.new
    $player_name = {1 => 'Ryan', 2 => 'David'}
    $tokens = {1 => 'X', 2 => 'O'}
    $game_over = false
    puts 'Welcome to Ruby Tic Tac Toe!'
    puts 'Commands: new | exit'
  end

  # Game loop
  def play
    until $game_over
      turn
    end
  end

  # What happens in a turn
  def turn
    player = $player_name[$player]
    token = $tokens[$player]
    if $turn==1
      first_turn(player, token)
    else
      puts "#{player}'s turn!"
      @board.render
      print "Place your #{token}: "
    end
    $turn += 1
    until @board.validate(token); end
    @board.game_end?
    switch
  end

  # What happens on turn 1
  def first_turn(player, token)
    puts "[#{token}] #{player} starts!"
    @board.render
    print 'Enter a number from 1-9 to make your play: '
  end

  # Switch control to other player
  def switch
    $player == 1? $player = 2 : $player = 1
  end

end

game = Game.new
game.play