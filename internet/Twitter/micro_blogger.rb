require 'jumpstart_auth'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class MicroBlogger
  attr_reader :client

  def initialize
    puts 'Initializing MicroBlogger'
    @client = JumpstartAuth.twitter
  end

  def run
    puts 'Welcome to the JSL Twitter Client!'
    command = ''
    while command != 'q'
      printf 'enter command: '
      input = gets.chomp
      parts = input.split(' ')
      command = parts[0]
      case command
        when 'q' then puts 'Goodbye!'
        when 't' then tweet(parts[1..-1].join(' '))
        when 'dm' then dm(parts[1], parts[2..-1].join(' '))
        else
          puts "Sorry, I don't understand #{command}"
      end
    end
  end

  def tweet(msg)
    if msg.length <= 140
      @client.update(msg)
    else
      puts 'Error - too many characters'
    end
    nil
  end

  def dm(target, message)
    puts @follower_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
    puts "Trying to send #{target} this direct message:"
    puts message
    if @follower_names.include? target
      message = "d @#{target} #{message}"
      tweet(message)
    else
      puts "#{target} is not following you!"
    end
  end

end

$blogger = MicroBlogger.new
$blogger.run




less = 'hello world'
exact = ''.ljust(140, "abcd")
over = ''.ljust(150, "abcd")