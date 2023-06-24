#! /bin/bash

# This program shows elements of the Periodic Table

# Postgres SQL command prefix
PSQL="psql -U freecodecamp -d periodic_table -tXA -c"

# If no argument, ask for an argument
if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
fi

