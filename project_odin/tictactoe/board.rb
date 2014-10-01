# Board state storage & logic
class Board
  def initialize
    $turn = 1
    $player = rand(1..2) # Randomize who starts
    @state = Array.new(10, ' ')
  end

  # Output board state to console
  def render
    puts '-------------'
    puts '| %s | %s | %s |' % @state[1..3]
    puts '-------------'
    puts '| %s | %s | %s |' % @state[4..6] + "  Turn #{$turn}/9"
    puts '-------------'                   + "  #{$tokens[1]}: #{$player_name[1]}"
    puts '| %s | %s | %s |' % @state[7..9] + "  #{$tokens[2]}: #{$player_name[2]}"
    puts '-------------'
    nil
  end

  def process_turn
    play = gets.chomp
    if play.downcase == 'exit'
      $game_over=true
    elsif play.downcase == 'new'
      restart
    elsif available_plays.include?(play.to_i)
      @state[play.to_i] = $tokens[$player]
      game_end?
      true
    else
      puts 'That is not available'
      puts "Valid inputs are: #{available_plays.join(', ')}, exit, new"
      false
    end
  end

  private

  def available_plays
    spaces = []
    @state[0..9].each_with_index do |s, i|
      spaces.push(i) if s == ' '
    end
    spaces[1..9]
  end

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