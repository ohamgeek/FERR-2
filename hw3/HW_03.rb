###############################################################################
#
# Introduction to Ruby on Rails
#
# Homework 03
#
# Purpose:
#
# Read the links below and complete the exercises in this file. This Lab
# is to help you better understand Arrays, Hashes and Loops that we
# learned in Lesson 03.
#
###############################################################################
#
# 1. Review your solution to Lab 02. Copy and Paste your solution to
#    this file.
#
# 2. Create a new Array variable called `set_of_numbers`, this will be
#    a range between 1 - 10 that our Player will guess from. Each value
#    in the Array should be an integer.
#
# 3. Change the variable `secret_number` (HW_02) so that instead of a hard-coded
#    Integer, it randomly chooses one of the options from `set_of_numbers`
#    ('secret_number' is the integer our Player will try to guess).
#
#      Hint: Look up Array#sample in the Ruby documentation.
#
# 4. Create a new Hash variable called `messages`. In this Hash will be
#    four Keys Value pairs:
#
#    1. :win - A String telling the Player that they have won.
#
#    2. :lose - A String telling the Player that they have lost and what
#       the correct number was.
#
#    3. :too_low - A String telling the Player that their guess was too
#       low.
#
#    4. :too_high - A String telling the Player that their guess was too
#       high.
#
# 5. Change the behavior of your program, so instead of hard coding, use the principles of DRY(don't repeat yourself). 
#    This means using a Loop to iterate over your code either until the Player has guessed the
#    correct number, or they have tried to guess 3 times.
#
# 6. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)
#
###############################################################################
#
#Put your solution below this line.
#
###############################################################################

#initialize the variable guesses_left to 3 and set the secret number the player must enter to win
guesses_left = 3

#create an array of integers that the player will guess from
set_of_numbers = [1,2,3,4,5,6,7,8,9,10]

#randomly generate the secret number from the set_of_numbers array
secret_number = set_of_numbers.sample

#start the game
puts "Welcome to the Secret Number Game created by Melissa Shields"
print "\nPlease enter your first name: "
player_name = gets.strip!

#create messages to player
message = {:win=>"Congratulations, #{player_name}! You've guessed the Secret Number, #{secret_number}!", 
:lose=>"Better luck next time, #{player_name}! You didn't guess the Secret Number, #{secret_number}.",
:too_low=>"#{player_name}, your guess was too low. Please guess higher next time.",
:too_high=>"#{player_name}, your guess was too high. Please guess lower next time."}


puts "\nHi " + player_name + "!"
puts "\nYou have 3 chances to correctly guess the Secret Number between 1 and 10."
###any loop would start here

puts "\n#{player_name}, you have #{guesses_left} chances left to guess the Secret Number."

#execute the loop until the player has guessed the Secret Number or made 3 incorrect guesses
3.times do
	break if guesses_left == 0
	print "\n#{player_name}, please enter your guess: "
	player_guess = gets.strip!.to_i
#if the player has guessed the secret number, congratulate them on winning the game
	if player_guess == secret_number
		puts "\n#{message[:win]}"
		exit
#if the player has guessed wrong and has additional guesses left, let them know how many guesses are left and give guidance on their next guess		
	elsif player_guess != secret_number && guesses_left >= 2
		
		puts "\nYour guess is incorrect."
		guesses_left = guesses_left - 1
		puts "\n#{player_name}, you have #{guesses_left} chances left to guess the Secret Number."

		if player_guess < secret_number
			puts "\n#{message[:too_low]}"
		else
			puts "\n#{message[:too_high]}"
		end
#if the player has made 3 incorrect guesses notify them that they've lost the game
	else
		puts "\n#{message[:lose]}"
		exit
	end
end