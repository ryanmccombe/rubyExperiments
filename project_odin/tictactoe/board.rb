# Board state storage & logic
class Board
  def initialize
    $turn = 1
    $player = rand(1..2) # Randomize who starts
    @state = Array.new(10, ' ')
  end

  # Render the board state
  def render
    puts '-------------'
    puts '| ' + @state[1] + ' | ' + @state[2] + ' | ' + @state[3] + ' |'
    puts '|-----------|'
    puts '| ' + @state[4] + ' | ' + @state[5] + ' | ' + @state[6] + " |  Turn #{$turn}/9 "
    puts "|-----------|  #{$tokens[1]}: #{$player_name[1]}"
    puts '| ' + @state[7] + ' | ' + @state[8] + ' | ' + @state[9] + " |  #{$tokens[2]}: #{$player_name[2]} "
    puts ' ------------'
    nil
  end

  # Store which positions are empty
  def available_plays
    spaces = []
    @state[0..9].each_with_index do |s, i|
      spaces.push(i) if s == ' '
    end
    spaces[1..9]
  end

  # Was play valid input and available?
  def validate(token)
    play = gets.chomp
    if play.downcase == 'exit'
      $game_over=true
      true
    elsif play.downcase == 'new'
      restart
      true
    elsif available_plays.include?(play.to_i)
      @state[play.to_i] = token
      true
    else
      puts 'That is not available'
      puts "Valid inputs are: #{available_plays.join(', ')}, exit, new"
      false
    end
  end

  # Boolean with whether player with provided token wins
  def win_condition?(token)
    # Horizontal Victories
    victory = true if @state.values_at(1,2,3).all? { |s| s==token }
    victory = true if @state.values_at(4,5,6).all? { |s| s==token }
    victory = true if @state.values_at(7,8,9).all? { |s| s==token }
    # Vertical Victories
    victory = true if @state.values_at(1,4,7).all? { |s| s==token }
    victory = true if @state.values_at(2,5,8).all? { |s| s==token }
    victory = true if @state.values_at(3,6,9).all? { |s| s==token }
    # Diagonal Victories
    victory = true if @state.values_at(1,5,9).all? { |s| s==token }
    victory = true if @state.values_at(3,5,7).all? { |s| s==token }
    victory ||= false
  end

  def game_end?
    if win_condition?($tokens[$player])
      render
      puts ''
      puts "#{$player_name[$player]} wins!"
      initialize
    elsif $turn==10
      puts ''
      puts 'Draw!'
      initialize
    else
      puts ''
      false
    end
  end

end