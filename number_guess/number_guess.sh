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
