#! /bin/bash

# This program shows elements of the Periodic Table

# Postgres SQL command prefix
PSQL="psql -U freecodecamp -d periodic_table -tXA -c"

# If no argument, ask for an argument
if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."

else
  ELEMENT_SELECTED=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM elements AS e LEFT JOIN properties AS p ON e.atomic_number=p.atomic_number LEFT JOIN types AS t ON p.type_id= t.type_id WHERE e.atomic_number::text='$1' OR e.symbol='$1' OR e.name='$1'")

  if [[ -z $ELEMENT_SELECTED ]]
  then
    echo -e "I could not find that element in the database."
  else
    # reading data
    echo "$ELEMENT_SELECTED" | while IFS="|" read A_NUMBER NAME SYMBOL TYPE A_MASS M_POINT B_POINT
    do
      echo -e "The element with atomic number $A_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $A_MASS amu. $NAME has a melting point of $M_POINT celsius and a boiling point of $B_POINT celsius."
    done
  fi

fi

