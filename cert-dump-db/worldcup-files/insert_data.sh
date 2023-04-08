#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -tX --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -tX --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# This program cleans and iserts the data from the games.csv file.
echo -e "\n~~ Inserting Teams ~~\n"

# Deleting data
echo $($PSQL "TRUNCATE TABLE games, teams")

# Data file name
#FILE_DATA=games_test.csv
FILE_DATA=games.csv

# include first line?
INCLUDE_FIRST=false

# Iterating teams
cat $FILE_DATA | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  # skip first line
  if ! $INCLUDE_FIRST
  then
   INCLUDE_FIRST=true
   continue
  fi

  #echo $YEAR $ROUND $WINNER $OPPONENT $W_GOALS $O_GOALS
  # get winner id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  # if not, insert winner
  if [[ -z $WINNER_ID ]]
  then
    echo $($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    echo $WINNER_ID
  fi
  
  # get opponent id
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
  # if not, insert opponent
  if [[ -z $OPPONENT_ID ]]
  then
    echo $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    echo $OPPONENT_ID
  fi
  #echo $WINNER_ID - $OPPONENT_ID
  # insert game
done 