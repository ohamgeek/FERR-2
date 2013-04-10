###############################################################################
#
# Introduction to Ruby on Rails
#
# Lab 04
#
# Purpose:
#
# Read the steps below and complete the exercises in this file. This Lab
# will help you to review the basics of Object-Oriented Programming that
# we learned in Lesson 04.
#
###############################################################################
#
# 1. Review your solution to Lab 03. Copy and Paste your solution to
#    this file.
#
# 2. Create a new method called `increment_guess_count` that takes
#    an integer parameter and increments it by 1.
#
# 3. Create a new method called `guesses_left` that calculates how many guesses 
#	 out of 3 the Player has left. The method should take one parameter that is the 
#	 number of guesses the player has guessed so far. Use this new method in your 
#	 code to tell the user how many guesses they have remaining. 
#
# 4. Make sure to remove your local variable `guesses_left` and use the
#    new method instead.

#think of additional methods to include for bonuses
#
# 5. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)
#
###############################################################################
#
# Student's Solution
#
###############################################################################
#create an array of integers that the player will guess from
set_of_numbers = (1..10).to_a

#randomly generate the secret number from the set_of_numbers array
secret_number = set_of_numbers.sample

#initialize the number of guesses taken by the player to 0
guess_count = 0

#create a method to increase the number of guesses taken by 1
def increment_guess_count(guess_count)
	guess_count += 1
end

#create a method to let the player know how many guesses they have left
#use downcase "y" in puts statement, because it will be concatenated to the player's name when displayed
def guesses_left(guess_count)
	guesses_left = 3 - guess_count
	puts "you have #{guesses_left} guesses left to guess the Secret Number."
end

#start the game and get the player's name, to customize messages
puts "Welcome to the Secret Number Game created by Melissa Shields"
print "\nPlease enter your first name: "
player_name = $stdin.gets.strip!

#create personalized messages to player
message = {:win=>"Congratulations, #{player_name}! You've guessed the Secret Number, #{secret_number}!", 
:lose=>"Better luck next time, #{player_name}! You didn't guess the Secret Number, #{secret_number}.",
:too_low=>"#{player_name}, your guess was too low. Please guess higher next time.",
:too_high=>"#{player_name}, your guess was too high. Please guess lower next time."}

puts "\nHi " + player_name + "!"
puts "\nYou have 3 chances to correctly guess the Secret Number between 1 and 10."
print "\n#{player_name}, "
guesses_left(guess_count)

#execute the loop until the player has guessed the Secret Number or made 3 incorrect guesses
3.times do
	break if guess_count == 3
	print "\n#{player_name}, please enter your guess: "
	player_guess = $stdin.gets.strip!.to_i
	guess_count = increment_guess_count(guess_count)
#if the player has guessed the secret number, congratulate them on winning the game
	if player_guess == secret_number
		puts "\n#{message[:win]}"
		exit
#if the player has guessed wrong and has additional guesses left, let them know how many guesses are left 
#and give guidance on their next guess		
	elsif player_guess != secret_number && guess_count <= 2
		
		puts "\nYour guess is incorrect."
		
		print "\n#{player_name}, "
		guesses_left(guess_count)

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