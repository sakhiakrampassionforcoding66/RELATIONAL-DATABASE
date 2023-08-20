#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

function MAIN(){
  #If no input received
  if [[ -z $1 ]]
  then
    echo "Please provide an element as an argument."
  else
  #Input not null
  #Search in DB
    SEARCH $1
  fi
}

function SEARCH(){

  #If input is a number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    SEARCH_DB=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number=$1;")
  else
  #If input is text
    SEARCH_DB=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) WHERE (name='$1' OR symbol='$1');")
  fi
  
  #If result null
  if [[ -z $SEARCH_DB ]]
  then
    #Echo message
    echo "I could not find that element in the database."
  else
    #Retrieve information about element
    echo "$SEARCH_DB" | while read AN BAR AM BAR MPC BAR BPC BAR TI BAR SY BAR NAME
    do
      #Search for type of material
      MT=$($PSQL "SELECT type FROM types WHERE type_id=$TI;")
      MT_FIX="$(echo $MT | sed -r 's/^ *| *$//g')"

      #Print desired message
      echo -e "The element with atomic number $AN is $NAME ($SY). It's a $MT_FIX, with a mass of $AM amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
    done
  fi
}

MAIN $1
