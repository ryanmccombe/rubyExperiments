require 'yaml'
require_relative 'hangman_modules'

class Game
  include Guess, Dictionary
  def initialize
    @dictionary = 'dictionary.txt'
    @min_length = 5
    @max_length = 12
    @lives = 5

    @game_over = false

    @game_state = {:word => get_word, :guesses => [], :lives => @lives}
    @game_state[:progress] = Array.new(@game_state[:word].length, '_')

    play
  end

  def play
    intro
    until @game_over
      turn
    end
  end

  def intro
    @show_intro ||= 1
    puts 'Welcome to Ruby Hangman!' if @show_intro == 1
    puts 'Commands: new save load exit' if @show_intro == 1
    @show_intro = 0
    print "The computer has generated a #{@game_state[:word].length} letter word: "
  end

  def turn
  # puts @game_state.inspect  #debug
    puts render_progress
    get_guess
    end_game?
  end

  def end_game?

    # Loss
    if @game_state[:lives] == 0
      puts 'You are out of Lives!'
      puts "The word was #{@game_state[:word].join('').capitalize}"
      exit

    # Win
    elsif (@game_state[:word] - @game_state[:guesses]).empty?
      puts "#{@game_state[:word].join('').capitalize}!"
      exit

    # Continue
    else
      @game_over = false
    end

  end


  # Commands
  def new_game
    initialize
  end

  def save_game
    File.open('savegame.yml', 'w') do |file|
      file.write @game_state.to_yaml
    end
  end

  def load_game
    if File.exists? 'savegame.yml'
      @game_state = YAML::load_file 'savegame.yml'
    end
    print "Loaded game with #{@game_state[:lives]} "
    puts "#{@game_state[:lives] > 1 ? 'lives' : 'life'} remaining"
    print "#{past_guesses}"
  end

end

Game.new

=begin

Welcome to Ruby Hangman!
Commands: new save load exit
The computer has generated a 11 letter word: _ _ _ _ _ _ _ _ _ _ _
Guess: A
Correct! _ _ _ _ _ _ A _ _ _ _
Guess: 2
Guess a single letter or enter a command: new | save | load | exit
Guess: ASD
Guess a single letter or enter a command: new | save | load | exit
Guess: AA
Guess a single letter or enter a command: new | save | load | exit
Guess: e
4 Lives  _ _ _ _ _ _ A _ _ _ _
Guess: i
Correct! _ _ _ I _ _ A _ I _ _
Guess: o
Correct! O _ _ I O _ A _ I _ _
Guess: u
3 Lives  O _ _ I O _ A _ I _ _
Guess: a
You Already Guessed A! Past guesses: A, E, I, O, U
Guess: save
Saved!   O _ _ I O _ A _ I _ _
Guess: new
The computer has generated a 10 letter word: _ _ _ _ _ _ _ _ _ _
Guess: A
Correct! _ A _ _ _ _ _ A _ _
Guess: A
You Already Guessed A! Past guesses: A
Guess: load
Loaded game with 3 lives remaining
Past guesses: A, E, I, O, U
O _ _ I O _ A _ I _ _
Guess: M
2 Lives  O _ _ I O _ A _ I _ _
Guess: N
Correct! O _ _ I O N A _ I _ _
Guess: R
1 Life   O _ _ I O N A _ I _ _
Guess: P
Correct! O P _ I O N A _ I _ _
Guess: O
You Already Guessed O! Past guesses: A, E, I, M, N, O, P, R, U
Guess: Z
You are out of Lives!
The word was Optionality

=end