require_relative 'player'
require_relative 'secret_number'

class Game
#	Make sure that all the instance variables in this class may only be READ and not WRITTEN to. 
  attr_reader :guesses_allowed, :current_guess_count, :current_guess, :set_of_numbers

  @@messages = { win: "You won!",
                 lose:  "You lost! :-(",
                 too_low: "Your guess was too low!",
                 too_high: "Your guess was too high!" }


	# Initializes The number of guesses (or tries) a player is allowed before the game ends.
	# You should default number of guesses to 3 if the parameter is null.
	# Sets a guess counter to zero.
	# Creates a new instance of the Player class. 
	# Creates a new instance of the SecretNumber class and assigns it to the secret_number. Don't forget to pass along the
	# necessary parameters.
  	# initializes the current guess to nil
  def initialize(guesses_allowed=3, set_of_numbers=(1..10))
    @guesses_allowed = guesses_allowed
    @set_of_numbers = set_of_numbers
    @current_guess_count = 0
    @current_guess = nil
    @secret_number = SecretNumber.new(@set_of_numbers).get_secret_number
    @player = Player.new
  end
  
  # Print who made this wonderful program :-)
  def print_created_by
    puts "Welcome to the Secret Number Game created by Melissa Shields"
  end
  

	# Calls `print_created_by` so that your players knows you created the game.
	# Asks the player to enter his/her name. Save it to @player.name.
	# Print out the number of guesses the players gets and the range of numbers they can choose from.
	# Asks the player for his/her guess. Use the `guess_correct?` method to verify the guess.
	# Continue to ask the user to guess the number so long as they have not maximized the number of guesses allowed 
	# and they did not guess correctly. 
  # Each time tell the player how many guesses left they have.
	# If at the end of the loop they still did not guess correctly, tell the player that they have lost using the
	# `@@messages` class variable and tell them the secret number.
  def start_game
    print_created_by

    print "\nPlease enter your name: " 
    @player.name = $stdin.gets.strip!

    puts "\nHi " + @player.name + "!"
    puts "\nYou have #{guesses_allowed} chances to correctly guess the Secret Number between #{@set_of_numbers}."

    while @current_guess_count < @guesses_allowed do
      print "\n#{@player.name}, please enter your guess: "
      @current_guess = $stdin.gets.strip!.to_i
      @guess_correct = guess_correct?(@current_guess)

      if @guess_correct == true
        exit
      elsif @guess_correct == false && @current_guess_count == @guesses_allowed
        puts "\n#{@@messages[:lose]}. The Secret Number was #{@secret_number}.  Better luck next time!" 
      end
    end
  end

	# This method checks if the player guessed the correct secret number. 
  # It shoudl print out if they guessed correctly or guessed too high or too low.
	# Use the `@@messages` Hash to display this feedback.
	# Also let the player know how many guesses they have left.
	# If the guess is correct, make sure to return true, otherwise return false.
  def guess_correct?(guess)
    if @current_guess == @secret_number
      puts "\n#{@@messages[:win]} The Secret Number was #{@secret_number}!"  
      return true

    elsif @current_guess > @secret_number
      puts "\n#{@@messages[:too_high]}" 
      increment_guess_count
      guesses_left
      return false

    else 
      puts "\n#{@@messages[:too_low]}"
      increment_guess_count
      guesses_left
      return false 
    end
  end

  # This method should increment every time the player guesses incorrectly.
  def increment_guess_count
    if @current_guess != @secret_number
      @current_guess_count += 1
    end
  end
  
  # Calculates the guesses the player has left.
  def guesses_left
    guesses_left = @guesses_allowed - @current_guess_count
    puts "\nYou have #{guesses_left} guesses remaining."
  end
end

