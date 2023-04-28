#! /bin/bash

# This program registers appointments for a salon.

# Postgres SQL command prefix
PSQL="psql -U freecodecamp -d salon -tXA -c"

echo -e "\n~~~~~ My Salon ~~~~~\n"
echo -e "Welcome to my Salon, how can I help you?\n"

# Main menu
MAIN_MENU() {
  
  # print message if any
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  ## Show services menu
  # get available services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services")
  
  # list services
  echo "$AVAILABLE_SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED

  # get service selected
  SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
 
  # if service not exist
  if [[ -z $SERVICE_SELECTED ]]
  then
    # show the main menu
    MAIN_MENU "I could not find that service. What would you like today?"

  else
    ## Register appointment
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # get custumer
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # if custumer not exist
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      # register new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi

    # get customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # ask time
    echo -e "\nWhat time would you like your $SERVICE_SELECTED, $CUSTOMER_NAME?"
    read SERVICE_TIME

    # register appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    # Show appointment data
    echo -e "\nI have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN_MENU


