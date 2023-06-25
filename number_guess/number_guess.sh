#! /bin/bash

# This program generates a random number between 1 and 1000 for users to guess

# Postgres SQL command prefix
PSQL="psql -U freecodecamp -d number_guess -tXA -c"

# Ask player name
echo -e "Enter your username:"
read USERNAME

# Select player
PLAYER_DATA=$($PSQL "SELECT games_played, best_game FROM players WHERE username='$USERNAME'")

# if player not exist
if [[ -z $PLAYER_DATA ]]
then
  # register new player
  REGISTER_RESULT=$($PSQL "INSERT INTO players(username, games_played, best_game) VALUES('$USERNAME', 0, 0)")

  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

else
  # read player data
  echo "$PLAYER_DATA" | while IFS="|" read GAMES_PLAYED BEST_GAME
  do
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done

fi

# generate a random number between 1 and 1000
RANDOM_NUMBER=$((RANDOM % 1000 + 1))

# number of tries
NUMBER_OF_GUESSES=0

# Print the random number
#echo -e "Number: $RANDOM_NUMBER"

# ask for a number
echo -e "\nGuess the secret number between 1 and 1000:"
read GUESSING_NUMBER
((NUMBER_OF_GUESSES++))

# check if input is a number, if not ask for a number
ASK_FOR_A_NUMBER() {
  while [[ ! $GUESSING_NUMBER =~ ^[0-9]+$ ]]
  do
    echo -e "\nThat is not an integer, guess again:"
    read GUESSING_NUMBER
    ((NUMBER_OF_GUESSES++))
  done
}

# print if input is lower or higher
IS_INPUT_LOW_OR_HIGH() {
  if [[ $GUESSING_NUMBER > $RANDOM_NUMBER ]]
  then
    echo -e "It's lower than that, guess again:"
  fi
  
  if [[ $GUESSING_NUMBER < $RANDOM_NUMBER ]]
  then
    echo -e "It's higher than that, guess again:"
  fi

  if [[ $GUESSING_NUMBER != $RANDOM_NUMBER ]]
  then
    read GUESSING_NUMBER
    ((NUMBER_OF_GUESSES++))
  fi
}

# save the player record
SAVE_THE_RECORD() {
  
  # get the player data
  PLAYER_DATA=$($PSQL "SELECT games_played, best_game FROM players WHERE username='$USERNAME'")
  
  echo "$PLAYER_DATA" | while IFS="|" read GAMES_PLAYED BEST_GAME
  do

    ((GAMES_PLAYED++))

    # set the new best game if is better or zero
    if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]] || [[ $BEST_GAME -eq 0 ]]
    then
      BEST_GAME=$NUMBER_OF_GUESSES
    fi
  
    # update new player data
    RECORD_RESULT=$($PSQL "UPDATE players SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'")

  done
}

# ask for numbers until guessing the number
while [[ $GUESSING_NUMBER != $RANDOM_NUMBER ]]
do
  ASK_FOR_A_NUMBER
  IS_INPUT_LOW_OR_HIGH
done

SAVE_THE_RECORD

echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
