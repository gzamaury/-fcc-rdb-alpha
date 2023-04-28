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
  SERVICE_SELECTED=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
 
  # if service not exist
  if [[ -z $SERVICE_SELECTED ]]
  then
    # show the main menu
    MAIN_MENU "I could not find that service. What would you like today?"
  fi

  # Register appointment

  # if client not exist

  # Show appointment data
  echo -e "\nYou choose the option: $SERVICE_ID_SELECTED"
}

MAIN_MENU


