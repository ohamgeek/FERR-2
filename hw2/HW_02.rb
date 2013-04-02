###############################################################################
#
# Introduction to Ruby on Rails
#
# Lab 02
#
# Purpose:
#
# Read the links below and complete the exercises in this file. This Lab
# is to test your knowledge of Variables and Conditionals which we
# learned in Lesson 02.
#
###############################################################################
#
# 1. Welcome users to your game. Let them know you are the creator. 
#
# 2. Ask the user for their name and store it in a variable.
#
# 3. Personally greet the player by printing to the screen, "Hi player_name! 
#	 Let them know they have 3 guesses to guess the Secret Number between 1 and 10.
#
# 4. Create a new Integer variables called `guesses_left`, this will count
#    down how many more times the Player can guess. It's initial value should
#    be 3.
#
# 5. Using String Interpolation, concatenate the variable `guesses_left`
#    into a String that tells the Player how many guesses they have left
#    and print it to the screen.
#
# 6. Create a new Integer variable called `secret_number` and set the value to
#    a number of your choosing between 1 and 10. This is the number that
#    our Player will try to guess.
#
# 7. Ask the Player to make their first guess. (Remember to cast input from the Player into the appropriate
#    data type).
#    
# 8.  Use a Conditional to find out if the Player has guessed the
#     correct number.
#
#     1. If they guessed correctly, tell them they won and exit the
#        script.
#	
#	  2. For an incorrect guess decrement the variable `guesses_left` by 1 and
#     print to the screen how many guesses the Player has left.
#
#     		1. If they guessed a number too low, tell them that they need to
#        	   guess higher on their next guess.
#
#     		2. If they guessed a number too high, tell them that they need to
#        	   guess lower on their next guess.
#		
# 9. Repeat the above process for a total of 3 times asking the Player
#     to make a guess and verify if the Player won.
#
# 10. If they do not make the correct guess after 3 tries, print that
#     the Player loses and what the `secret_number` was.
#
# 11. Make sure to add helpful comments to your code to document what
#     each section does.
#
###############################################################################
#
# Student's Solution
#
###############################################################################
puts "Welcome to the Secret Number Game created by Melissa Shields"
print "Please enter your first name: "
player_name = gets.strip!

puts "Hi " + player_name + "!"
puts "You have 3 chances to correctly guess the Secret Number between 1 and 10."

#initialize the variable guesses_left to 3 and set the secret number the player must enter to win
guesses_left = 3
secret_number = 7

puts "#{player_name}, you have #{guesses_left} chances left to guess the Secret Number."

#execute the while loop until the player has guessed the Secret Number or made 3 incorrect guesses
while guesses_left > 0 do
	print "#{player_name}, please enter your guess: "
	player_guess = gets.strip!.to_i
#if the player has guessed the secret number, congratulate them on winning the game
	if player_guess == secret_number
		puts "Congratulations, #{player_name}! You have won the game by correctly guessing the Secret Number, #{secret_number}!"
#if the player has guessed wrong and has additional guesses left, let them know how many guesses are left and give guidance on their next guess		
	elsif player_guess != secret_number && guesses_left >= 2
		
		puts "Your guess is incorrect."
		guesses_left = guesses_left - 1
		puts "#{player_name}, you have #{guesses_left} chances left to guess the Secret Number."

		if player_guess < secret_number
			puts "Please make your next guess higher than #{player_guess}."
		else
			puts "Please make your next guess lower than #{player_guess}."
		end
#if the player has made 3 incorrect guesses notify them that they've lost the game
	else
		puts "Better luck next time, #{player_name}! You didn't guess the Secret Number, #{secret_number}."
	end

#if the player has won, set guesses_left to 0 to exit the program
	if player_guess == secret_number
		guesses_left = 0
	end
end