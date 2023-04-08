#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -tX --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -tX --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# This program cleans and iserts the data from the games.csv file.

# Data file name
#FILE_DATA=games_test.csv
FILE_DATA=games.csv

# Remove data first
REMOVE_DATA=true

# Include first line?
INCLUDE_FIRST=false

# Deleting data
if $REMOVE_DATA
then
  echo -e "\n~~ Removing Data ~~\n"
  TRUNCATE_RESULT=$($PSQL "TRUNCATE TABLE games, teams")
  if [[ $TRUNCATE_RESULT == 'TRUNCATE TABLE' ]]
  then
    echo -e 'ALL DATA REMOVED!'
  fi
fi

# Inserting data
echo -e "\n~~ Inserting Data ~~\n"

# Iterating data
cat $FILE_DATA | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  # skip first line
  if ! $INCLUDE_FIRST
  then
    echo 'First line skiped.'
    INCLUDE_FIRST=true
    continue
  fi

  #echo $YEAR $ROUND $WINNER $OPPONENT $W_GOALS $O_GOALS
  # get winner id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  # if not, insert winner
  if [[ -z $WINNER_ID ]]
  then
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
    then
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
      echo Inserted Team: $WINNER - ID: $WINNER_ID
    fi
  fi
  
  # get opponent id
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
  # if not, insert opponent
  if [[ -z $OPPONENT_ID ]]
  then
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
    then
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
      echo Inserted Team: $OPPONENT - ID: $OPPONENT_ID
    fi
  fi
  #echo $WINNER_ID - $OPPONENT_ID
  
  # insert game  
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $W_GOALS, $O_GOALS)")
  if [[ $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
  then
    echo Inserted Game: $YEAR, $ROUND, $WINNER $W_GOALS vs $O_GOALS $OPPONENT
  fi
done

echo -e "\n~~ All data inserted. ~~\n"
