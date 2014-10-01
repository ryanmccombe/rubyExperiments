# Board state storage & logic
class Board
  def initialize(state = Array.new(10," "))
    @state = state
    @spaces = available_plays(@state)
  end

  # Array with what positions are empty
  def available_plays(state = @state)
    spaces = []
    state[0..9].each_with_index do |s, i|
      spaces.push(i) if s == " "
    end
    spaces[1..9]
  end

  # Was play valid input and available?
  def validate(play, token)
    @state[play] = token
  end

  # Render the board state
  def render
    puts " " + @state[1] + " | " + @state[2] + " | " + @state[3] + " | Turn: "
    puts "-----------|"
    puts " " + @state[4] + " | " + @state[5] + " | " + @state[6] + " | Player 1: "
    puts "-----------|"
    puts " " + @state[7] + " | " + @state[8] + " | " + @state[9] + " | Player 2: "
    nil
  end

  # Boolean with whether player with provided token wins
  def victory(token)
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

end