# Number Guessing Game

This project aims at creating a bash script witch records every game a user plays. Each game consists in guessing a pre-determined, random generated number with the least number of tries as possible.

Each games records the user who is playing, as well as the number of guesses it took to get to the current answer.

So as to aid the player, with each guess the game returns one of three prompts: if the number is greater than the objective, it should return `It's lower than that, guess again:`; if the guess is lower, one should get `It's higher than that, guess again:`; otherwise, it should return the total number of tries as well as the number to guess.

This is achieved by the `number_guess.sh` file; the resulting database is exported to `number_guess.sql`.

### Solution:

For the script, check `number_guess.sh`; the database is in the `number_guess.sql` file.
