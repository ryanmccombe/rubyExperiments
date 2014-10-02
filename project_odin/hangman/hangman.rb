require 'yaml'
$debug = true

class Game
 #attr_reader :progress

  def initialize
    @game_over = false
    @show_intro = true

    #Rules
    @dictionary = 'dictionary.txt'
    @min_length = 5
    @max_length = 12
    @lives = 5

    @game_state = Hash.new
      @game_state[:word] = get_word
      @game_state[:progress] = Array.new(@game_state[:word].length, '_')
      @game_state[:guesses] = []
      @game_state[:lives] = $lives

    puts @game_state.inspect if $debug

  end

  def play
    intro if @show_intro
    until @game_over
      turn
    end
  end

  def new

  end

  def save

  end

  def load

  end

  def turn

  end

  def intro

  end

  def generate_dictionary
    dictionary = []
    File.readlines(@dictionary).each do |line|
      dictionary << line.strip
    end

    dictionary.select do |word|
      (@min_length..@max_length).include? word.length
    end
  end

  def get_word
    generate_dictionary.sample.downcase.split('')
  end

  def render_progress
    @game_state[:progress].join(' ')
  end

  def get_guess
    print 'Guess: '
    guess = gets.chomp
    if guess.downcase == new

    elsif guess.downcase == save

    elsif guess.downcase == load

    elsif validate(guess)

    else
      puts "Invalid"
      get_guess
    end
  end

  def validate(guess)
    test( // , guess) ###
  end

end

game = Game.new

