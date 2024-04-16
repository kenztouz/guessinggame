#!/bin/bash

# Define a function to get the number of files in the current directory
get_num_files() {
  ls | wc -l
}

# Define a function to get the user's guess
get_user_guess() {
  read -p "Enter your guess: " guess
  echo $guess
}

# Create a loop that continues until the user's guess is correct
while true
do
  # Get the number of files in the current directory
  num_files=$(get_num_files)

  # Get the user's guess
  guess=$(get_user_guess)

  # Check if the user's guess is correct
  if [ "$guess" -eq "$num_files" ]
  then
    echo "Congratulations! You guessed the correct number of files."
    break
  fi

  # Check if the guess is too high
  if [ "$guess" -gt "$num_files" ]
  then
    echo "Your guess is too high. Try again."
  fi

  # Check if the guess is too low
  if [ "$guess" -lt "$num_files" ]
  then
    echo "Your guess is too low. Try again."
  fi
done

# Define a function to count the number of lines in a file
count_lines() {
  wc -l $1 | awk '{print $1}'
}

# Count the number of lines in guessinggame.sh
num_lines=$(count_lines $0)

# Get the current date and time
date_time=$(date)

# Print the title of the project, the date and time, and the number of lines of code in guessinggame.sh to the README.md file
echo "Guessing Game" > README.md
echo "" >> README.md
echo "Date and Time: $date_time" >> README.md
echo "" >> README.md
echo "Number of Lines of Code: $num_lines" >> README.md
