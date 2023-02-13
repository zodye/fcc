#!/bin/bash
echo -e "\n~~Number Guess Game~~\n"
PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"

echo "Enter your username:"
read USERNAME

USERNAME_SEARCH_RESULT=$($PSQL "SELECT * FROM users WHERE username = '$USERNAME'")
if [[ -z $USERNAME_SEARCH_RESULT ]]
then
  USERNAME_INSERT_RESULT=$($PSQL "INSERT INTO users(username, games_played) VALUES('$USERNAME', 0)")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

else
  echo "$USERNAME_SEARCH_RESULT" | while read USERNAME BAR GAMES_PLAYED BAR BEST_GAME
  do
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

RAND_NUM=$(($RANDOM % 1000 + 1))
GUESS_TIMES=0
echo "Guess the secret number between 1 and 1000:"
while [[ $USER_NUM -ne $RAND_NUM ]]
do
  read USER_NUM
  if [[ $USER_NUM =~ ^[0-9]+$ ]]
  then
    if [[ $USER_NUM -gt $RAND_NUM ]]
    then
      echo -e "\nIt's lower than that, guess again:"
    elif [[ $USER_NUM -lt $RAND_NUM ]]
    then
      echo -e "\nIt's higher than that, guess again:"
    fi
  else
    echo -e "\nThat is not an integer, guess again:"
  fi

  GUESS_TIMES=$(($GUESS_TIMES + 1))
done

USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$USERNAME'")
echo "$USER_DATA" | while read GAMES_PLAYED BAR BEST_GAME
do
  if [[ $GUESS_TIMES -lt $BEST_GAME || -z $BEST_GAME ]]
  then
    SAVE_USER_GAMEPLAY=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED+1, best_game = $GUESS_TIMES WHERE username = '$USERNAME'")
  else
    SAVE_USER_GAMEPLAY=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED+1 WHERE username = '$USERNAME'")
  fi
done

echo -e "\nYou guessed it in $GUESS_TIMES tries. The secret number was $RAND_NUM. Nice job!"
