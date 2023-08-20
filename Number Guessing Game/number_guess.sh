#!/bin/bash

PSQL="psql -X -t --username=freecodecamp --dbname=number_guess -c"

clear

function MAIN(){
  
echo "Enter your username:"
read USER

#Search user in db
USER_SEARCH_RESULT=$($PSQL "SELECT * FROM users WHERE user_name='$USER'")
#If not found, new message
if [[ -z $USER_SEARCH_RESULT ]]
then
  echo "Welcome, $USER! It looks like this is your first time here."

  #Add user
  USER_ADD=$($PSQL "INSERT INTO users(user_name) VALUES('$USER');")
else
#If found, print message
  echo "$USER_SEARCH_RESULT" | while read USER_ID BAR USER_NAME
  do
    NUMBER_GAMES=$($PSQL "SELECT COUNT(*) FROM records WHERE user_id = $USER_ID;")
    BEST_SCORE=$($PSQL "SELECT guesses FROM records WHERE user_id = $USER_ID ORDER BY guesses ASC LIMIT 1;")

    NUMBER_GAMES="$(echo $NUMBER_GAMES | sed -r 's/^ *$| *$//g')"
    BEST_SCORE="$(echo $BEST_SCORE | sed -r 's/^ *$| *$//g')"
    
    echo "Welcome back, $USER_NAME! You have played $NUMBER_GAMES games, and your best game took $BEST_SCORE guesses."
  done
fi

 GAME
}

function GAME(){
  #Get user_id for later
  USER_ID="$(echo $($PSQL "SELECT user_id FROM users WHERE user_name = '$USER';") | sed -r 's/^ *| * $//g')"

  #Generate random number
  RN=$(($RANDOM % 1000 + 1))
  TRIES=0
  #Flag checks if user has guessed
  FLAG=false
  #While cycle
  echo -e "\nGuess the secret number between 1 and 1000:"

  while [[ $FLAG = false ]]
  do
    read GUESS
  
    #If number is not a number
    if ! [[ $GUESS =~ ^[0-9]+$ ]]
    then
      #Print error message
      echo -e "\nThat is not an integer, guess again:"
    elif [[ $GUESS -lt $RN ]]
    then
      #Append one to number of tries
      ((TRIES++))
      #Print error message
      echo -e "\nIt's higher than that, guess again:"
    elif [[ $GUESS -gt $RN ]]
    then
      #Append one to number of tries
      ((TRIES++))
      #Print error message
      echo -e "\nIt's lower than that, guess again:"
    else
      #Change flag
      ((TRIES++))
      FLAG=true
    fi
  done

  #Print message
  echo "You guessed it in $TRIES tries. The secret number was $RN. Nice job!"

  #Add new record
  RECORD_ADD=$($PSQL "INSERT INTO records(user_id, guesses) VALUES($USER_ID, $TRIES);")
}

MAIN
