#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c "

echo -e "\n~~~~ Salon ~~~~\n"

MAIN_MENU () {

  #Greeting page when there is no input

  if [[ -z $1 ]]
  then
    echo -e "Welcome to the Cappiello Salon!\n\nPlease, pick a service from the following options:"
  else
   echo $1
  fi

  SERVICES_MENU
}

SERVICES_MENU(){
  ALL_SERVICES=$($PSQL "SELECT * FROM services;")

  echo "$ALL_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  #input
  read SERVICE_ID_SELECTED
  #if input not number

  if ! [[ $SERVICE_ID_SELECTED =~ ^[0-9]*$ ]]
  then
    MAIN_MENU "Invalid service. Please, try again."
  else
    #search service_id
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
    
    #service not on the list
    if [[ -z $SERVICE_NAME ]]
    then
      #return to main menu
      MAIN_MENU "Unfortunately, we do not provide that service. Please, try again."
    else
      #ask for number
      echo -e "\nWhat is your phone number?"
      read CUSTOMER_PHONE

      #search for phone in database
      PHONE_RESULT=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")

      #if not on the database
      if [[ -z $PHONE_RESULT ]]
      then

        #ask for name
        echo -e "\nNew to the salon, I see! What is your name?"
        read CUSTOMER_NAME

        #add to database
        CUSTOMER_ADD=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE');")
      fi

      #get the id for the new customer
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
      CUSTOMER_NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')
      SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')

      echo -e "\nVery well. What time would you like your $SERVICE_NAME_FORMATTED at, $CUSTOMER_NAME_FORMATTED:"
      read SERVICE_TIME

      #add service to the database
      APPOINT_ADD=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")

      echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED."
    fi
  fi
}

MAIN_MENU

