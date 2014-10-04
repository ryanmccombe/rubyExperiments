# Guess Handling
module Guess
  def get_guess
    print 'Guess: '
    guess = gets.chomp.downcase
    if guess == 'new'
      new_game
    elsif guess == 'save'
      print 'Saved!   '
      save_game
    elsif guess == 'load'
      load_game
    elsif guess == 'exit'
      exit
    elsif validate(guess)
      process(guess)
    else
      get_guess
    end
  end

  def past_guesses
    puts "Past guesses: #{@game_state[:guesses].sort.join(', ').upcase}"
  end

  def validate(guess)
    if /^[a-zA-Z]$/ === guess
      if @game_state[:guesses].include?(guess)
        print "You Already Guessed #{guess.upcase}! "
        past_guesses
        return false
      else
        return true
      end
    else
      # Invalid input
      puts 'Guess a single letter or enter a command: new | save | load | exit'
      false
    end
  end

  def process(guess)
    @game_state[:guesses] << guess
    if @game_state[:word].include? (guess)
      print 'Correct! '
    else
      lives = @game_state[:lives] -= 1
      unless lives == 0
        print "#{lives} #{lives > 1 ? 'Lives' : 'Life '}  "
      end
    end
  end

  def render_progress
    @game_state[:progress] = @game_state[:word].map do |i|
      @game_state[:guesses].include?(i) ? i.upcase : '_'
    end
    @game_state[:progress].join(' ')
  end
end


# Generate word
module Dictionary
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
end