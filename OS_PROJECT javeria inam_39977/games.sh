#!/bin/bash

# Color variables
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BOLD_YELLOW="\e[1;33m" 
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
RESET="\e[0m"

# Function to display the main menu
main_menu() {
  echo -e "${CYAN}                               ======================================${RESET}"
  echo -e "${MAGENTA}                                     Mini Games Collection        ${RESET}"
  echo -e "${CYAN}                               ======================================${RESET}"
  echo -e
  echo -e "${BOLD_YELLOW}1. Display the game rules${RESET}"
  echo -e "${BOLD_YELLOW}2. Guess the Number${RESET}"
  echo -e "${BOLD_YELLOW}3. Rock, Paper, Scissors${RESET}"
  echo -e "${BOLD_YELLOW}4. Dice Roll${RESET}"
  echo -e "${BOLD_YELLOW}5. Word Scramble${RESET}"
  echo -e "${BOLD_YELLOW}6. Math Quiz${RESET}"
  echo -e "${BOLD_YELLOW}7. Tic Tac Toe${RESET}"
  echo -e "${BOLD_YELLOW}8. Coin Toss${RESET}"
  echo -e "${BOLD_YELLOW}9. Category Blitz${RESET}"
  echo -e "${BOLD_YELLOW}10. Emoji Decode${RESET}"
  echo -e "${BOLD_YELLOW}11. Animal Sound Challenge${RESET}"
  echo -e "${BOLD_YELLOW}12. Exit${RESET}"
  echo -e 
   echo -e -n "${BOLD_YELLOW}Choose a game (1-12): ${RESET}"
  read choice

   case $choice in
    1) display_rules ;;
    2) guess_the_number ;;
    3) rock_paper_scissors ;;
    4) dice_roll ;;
    5) word_scramble ;;
    6) math_quiz ;;
    7) tic_tac_toe ;;
    8) coin_toss ;;
    9) category_blitz ;;
    10) emoji_decode ;;
    11) animal_sound_challenge ;;
    12) echo -e "${GREEN}Thanks for playing! Goodbye!${RESET}" ; exit ;;
    *) echo -e "${RED}Invalid choice, try again.${RESET}" ; main_menu ;;
  esac
}
  main_menu


# Display game rules
display_rules() {
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e "${MAGENTA}                                       Game Rules                 ${RESET}"
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e
  echo -e "${BOLD_YELLOW}1. Guess the Number${RESET}: Try to guess a random number between 1 and 100. After each guess, you'll get a hint whether the number is too high or too low."
  echo -e "${BOLD_YELLOW}2. Rock, Paper, Scissors${RESET}: Choose Rock, Paper, or Scissors to compete against the computer. Rock beats Scissors, Scissors beats Paper, and Paper beats Rock."
  echo -e "${BOLD_YELLOW}3. Dice Roll${RESET}: Roll two dice. If the total is more than 6, you win; if it's less, you lose; and if it's exactly 6, it's a tie."
  echo -e "${BOLD_YELLOW}4. Word Scramble${RESET}: Unscramble the given scrambled word. Enter the correct word to win."
  echo -e "${BOLD_YELLOW}5. Math Quiz${RESET}: Solve simple math problems (addition or subtraction). Enter the correct answer to win."
  echo -e "${BOLD_YELLOW}6. Hangman${RESET}: Guess the letters of a hidden word. If you guess wrong too many times, you lose."
  echo -e "${BOLD_YELLOW}7. Coin Toss${RESET}: Simulate a coin toss and guess whether it will land on Heads or Tails."
  echo -e "${BOLD_YELLOW}8. Tic Tac Toe${RESET}: Play against the computer. The goal is to align three of your symbols (X) horizontally, vertically, or diagonally on a 3x3 grid."
  echo -e "${BOLD_YELLOW}9. Category Blitz${RESET}: Quickly name items that fit the given category before time runs out!"
  echo -e "${BOLD_YELLOW}10. Emoji Decode${RESET}: Guess the word or phrase based on the displayed emojis."
  echo -e "${BOLD_YELLOW}11. Animal Sound Challenge${RESET}: Identify the animal based on the description of its sound."
  echo -e "${BOLD_YELLOW}12. Exit${RESET}: Exit the game."
  echo -e


  # Return to the main menu
  echo -e -n "${YELLOW}Press Enter to return to the main menu.${RESET}"
  read
  main_menu
}

# Game 1: Guess the Number
guess_the_number() {
  echo -e "${CYAN}                               ======================================${RESET}"
  echo -e "${MAGENTA}                                       Guess the number x          ${RESET}"
  echo -e "${CYAN}                               ======================================${RESET}"
  echo -e
  target=$((RANDOM % 100 + 1))
  attempts=0
  while true; do
     echo -e -n "${BOLD_YELLOW}Guess a number between 1 and 100: ${RESET}"
  read guess
    ((attempts++))
    if [[ $guess -eq $target ]]; then
      echo -e "${GREEN}Congratulations! You guessed the number in $attempts attempts.${RESET}"
      break
    elif [[ $guess -lt $target ]]; then
      echo -e "${BLUE}Too low!${RESET}"
    else
      echo -e "${BLUE}Too high!${RESET}"
    fi
  done
  main_menu
}

# Game 2: Rock, Paper, Scissors
rock_paper_scissors() {
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e "${MAGENTA}                                      Rock, Paper, Scissors         ${RESET}"
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e
  options=("Rock" "Paper" "Scissors")

  # Correctly select a random index between 0 and 2
  computer_choice=${options[$((RANDOM % 3))]}  # Restrict RANDOM to 0, 1, or 2

  # Prompt user for input
  echo -e "${BOLD_YELLOW}Choose: Rock, Paper, or Scissors ${RESET}"
  echo -e -n "${BOLD_YELLOW}Your choice: ${RESET}"
  read player_choice

  # Convert both player and computer choices to lowercase
  player_choice=$(echo "$player_choice" | tr '[:upper:]' '[:lower:]')
  computer_choice=$(echo "$computer_choice" | tr '[:upper:]' '[:lower:]')

  # Compare choices
  if [[ $player_choice == $computer_choice ]]; then
    echo -e "${YELLOW}It's a tie! Both chose $player_choice.${RESET}"
  elif [[ ($player_choice == "rock" && $computer_choice == "scissors") ||
          ($player_choice == "paper" && $computer_choice == "rock") ||
          ($player_choice == "scissors" && $computer_choice == "paper") ]]; then
    echo -e "${GREEN}You win! $player_choice beats $computer_choice.${RESET}"
  else
    echo -e "${RED}You lose! $computer_choice beats $player_choice.${RESET}"
  fi

  main_menu
}

# Game 3: Dice Roll

dice_roll() {
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e "${MAGENTA}                                            Dice Roll             ${RESET}"
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e

  dice1=$((RANDOM % 6 + 1))
  dice2=$((RANDOM % 6 + 1))
  total=$((dice1 + dice2))

  echo -e "${YELLOW}You rolled: $dice1 and $dice2${RESET}"
  echo -e "${GREEN}Total: $total${RESET}"

  # Check if the total is below, above, or exactly 6
  if [ $total -lt 6 ]; then
    echo -e "${RED}You lose!${RESET}"
  elif [ $total -gt 6 ]; then
    echo -e "${GREEN}You win!${RESET}"
  else
    echo -e "${YELLOW}It's a tie!${RESET}"
  fi

  main_menu
}


# Game 4: Word Scramble
word_scramble() {
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e "${MAGENTA}                                           Word Scramble          ${RESET}"
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e
  words=("apple" "banana" "cherry" "grape" "orange" "peach" "plum")
  word=${words[$((RANDOM % ${#words[@]}))]}
  scrambled=$(echo "$word" | fold -w1 | shuf | tr -d '\n')
  echo -e "${BOLD_YELLOW}Unscramble this word: $scrambled${RESET}"
   echo -e -n "${YELLOW}Your answer: ${RESET}"
  read answer
  

  if [[ $answer == $word ]]; then
    echo -e "${GREEN}Correct! The word is $word.${RESET}"
  else
    echo -e "${RED}Incorrect! The word was $word.${RESET}"
  fi
  main_menu
}

# Game 5: Math Quiz
math_quiz() {
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e "${MAGENTA}                                            Math Quiz             ${RESET}"
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e
  num1=$((RANDOM % 50 + 1))
  num2=$((RANDOM % 50 + 1))
  operator=$((RANDOM % 2))
  if [[ $operator -eq 0 ]]; then
    echo -e "${BOLD_YELLOW}Solve: $num1 + $num2${RESET}"
    correct=$((num1 + num2))
  else
    echo -e "${BOLD_YELLOW}Solve: $num1 - $num2${RESET}"
    correct=$((num1 - num2))
  fi
 echo -e -n "${BOLD_YELLOW}Your answer: ${RESET}"
  read answer

  if [[ $answer -eq $correct ]]; then
    echo -e "${GREEN}Correct!${RESET}"
  else
    echo -e "${RED}Incorrect! The correct answer is $correct.${RESET}"
  fi
  main_menu
}

# Game 6: Tic Tac Toe
tic_tac_toe() {
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e "${MAGENTA}                                           Tic Tac Toe            ${RESET}"
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e

  # Initialize the board
  board=("1" "2" "3" "4" "5" "6" "7" "8" "9")

  # Function to display the board
  display_board() {
    echo -e "${BLUE} ${board[0]} | ${board[1]} | ${board[2]} ${RESET}"
    echo -e "${BLUE}---+---+---${RESET}"
    echo -e "${BLUE} ${board[3]} | ${board[4]} | ${board[5]} ${RESET}"
    echo -e "${BLUE}---+---+---${RESET}"
    echo -e "${BLUE} ${board[6]} | ${board[7]} | ${board[8]} ${RESET}"
  }

  # Check if a player has won
  check_winner() {
    win_combinations=(
      "0 1 2" "3 4 5" "6 7 8" # Rows
      "0 3 6" "1 4 7" "2 5 8" # Columns
      "0 4 8" "2 4 6"         # Diagonals
    )
    for combo in "${win_combinations[@]}"; do
      indices=($combo)
      if [[ ${board[${indices[0]}]} == ${board[${indices[1]}]} && 
            ${board[${indices[1]}]} == ${board[${indices[2]}]} ]]; then
        winner=${board[${indices[0]}]}
        return 0
      fi
    done
    return 1
  }

  # Check for a draw
  check_draw() {
    for cell in "${board[@]}"; do
      if [[ $cell != "X" && $cell != "O" ]]; then
        return 1
      fi
    done
    return 0
  }

  # Function for the computer's move
  computer_move() {
    while true; do
      computer_choice=$((RANDOM % 9))
      if [[ ${board[$computer_choice]} != "X" && ${board[$computer_choice]} != "O" ]]; then
        board[$computer_choice]="O"
        break
      fi
    done
  }

  # Main game loop
  while true; do
    # Player's turn
    display_board
    echo -e "${BOLD_YELLOW}Your turn! Choose a position (1-9): ${RESET}"
    read position

    # Validate input
    if ! [[ $position =~ ^[1-9]$ ]] || [[ ${board[$((position - 1))]} == "X" || ${board[$((position - 1))]} == "O" ]]; then
      echo -e "${RED}Invalid move. Try again.${RESET}"
      continue
    fi

    # Make the player's move
    board[$((position - 1))]="X"

    # Check for a winner
    if check_winner; then
      display_board
      echo -e "${GREEN}Congratulations! You win!${RESET}"
      break
    fi

    # Check for a draw
    if check_draw; then
      display_board
      echo -e "${YELLOW}It's a draw!${RESET}"
      break
    fi

    # Computer's turn
    echo -e "${CYAN}Computer's turn...${RESET}"
    sleep 1
    computer_move

    # Check for a winner
    if check_winner; then
      display_board
      echo -e "${RED}The computer wins! Better luck next time.${RESET}"
      break
    fi

    # Check for a draw
    if check_draw; then
      display_board
      echo -e "${YELLOW}It's a draw!${RESET}"
      break
    fi
  done

  main_menu
}
 

# Game 7: Coin Toss
coin_toss() {
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e "${MAGENTA}                                           Coin Toss               ${RESET}"
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e
  echo -e "${BOLD_YELLOW}Choose: Heads or Tails${RESET}"
  echo -e -n "${BOLD_YELLOW}Your choice: ${RESET}"
  read player_choice

  toss_result=$((RANDOM % 2))
  if [[ $toss_result -eq 0 ]]; then
    computer_choice="heads"
  else
    computer_choice="tails"
  fi

  player_choice=$(echo "$player_choice" | tr '[:upper:]' '[:lower:]')

  if [[ $player_choice == $computer_choice ]]; then
    echo -e "${GREEN}You win! It was $computer_choice.${RESET}"
  else
    echo -e "${RED}You lose! It was $computer_choice.${RESET}"
  fi

  main_menu
}

# Game 8: Category Blitz
category_blitz() {
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e "${MAGENTA}                                           Category Blitz      ${RESET}"
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e

  # Explain the rules
  echo -e "${BOLD_YELLOW}Test your quick thinking!${RESET}"
  echo -e "${YELLOW}I will give you a category, and you must name 3 items in that category.${RESET}"
  echo -e "${YELLOW}You have 10 seconds to answer!${RESET}"
  echo -e

  categories=("Fruits" "Colors" "Animals" "Countries" "Sports" "Vegetables" "Movies" "Flowers" "Planets" "Instruments")
  category=${categories[$((RANDOM % ${#categories[@]}))]}

  # Display the category to the player
  echo -e "${BOLD_YELLOW}Your category is: ${RESET}${MAGENTA}$category${RESET}"
  echo -e "${YELLOW}Name 3 items in this category:${RESET}"
  
  # Start the timer and prompt the player for input
  echo -e -n "${BOLD_YELLOW}Your answer: ${RESET}"
  SECONDS=0
  read answer
  elapsed_time=$SECONDS

  # Check if the player answered within 10 seconds
  if ((elapsed_time > 10)); then
    echo -e "${RED}Time's up! You took too long.${RESET}"
  else
    # Validate the player's input (simple validation)
    items_count=$(echo "$answer" | tr ' ' '\n' | wc -l)
    if ((items_count >= 3)); then
      echo -e "${GREEN}Well done! You named $items_count items in the category $category.${RESET}"
    else
      echo -e "${RED}You only named $items_count items. You needed 3!${RESET}"
    fi
  fi

  # End of the game
  main_menu
}

# Game 9: Emoji Decode
emoji_decode() {
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e "${MAGENTA}                                           Emoji Decode        ${RESET}"
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e

  # Explain the rules
  echo -e "${BOLD_YELLOW}Decode the emojis to find the correct word or phrase!${RESET}"
  echo -e "${YELLOW}I will show you a set of emojis, and you must guess what they represent.${RESET}"
  echo -e

  # Predefined emoji riddles
  riddles=(
    "🍎🍌🍇 (Fruit basket)" 
    "🚗💨 (Fast car)"
    "🎵🎤 (Singing)"
    "🍕🍔🌭 (Fast food)"
    "📖👓 (Reading)"
    "🏖️🌊☀️ (Beach vacation)"
    "🐕🐾 (Dog walk)"
    "🚀🌕 (Space mission)"
    "💼📈 (Business)"
    "🎉🎂🎁 (Birthday)"
  )

  # Randomly select a riddle
  selected_riddle=${riddles[$((RANDOM % ${#riddles[@]}))]}
  riddle_emoji=$(echo "$selected_riddle" | cut -d '(' -f1)
  riddle_answer=$(echo "$selected_riddle" | cut -d '(' -f2 | tr -d ')')

  # Display the emojis to the player
  echo -e "${BOLD_YELLOW}Decode this: ${RESET}${MAGENTA}$riddle_emoji${RESET}"
  echo -e -n "${BOLD_YELLOW}Your answer: ${RESET}"
  read player_answer

  # Check the player's answer
  if [[ "${player_answer,,}" == "${riddle_answer,,}" ]]; then
    echo -e "${GREEN}Correct! The answer is: $riddle_answer.${RESET}"
  else
    echo -e "${RED}Wrong! The correct answer is: $riddle_answer.${RESET}"
  fi

  # Return to main menu
  main_menu
}

# Game 18: Animal Sound Challenge
animal_sound_challenge() {
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e "${MAGENTA}                                      Animal Sound Challenge   ${RESET}"
  echo -e "${CYAN}                                =====================================${RESET}"
  echo -e

  # Explain the rules
  echo -e "${BOLD_YELLOW}Guess the animal based on the sound it makes!${RESET}"
  echo -e "${YELLOW}I will describe the sound, and you must type the name of the animal.${RESET}"
  echo -e

  # Predefined animal sounds
  sounds=(
    "Meows softly (Cat)"
    "Barks loudly (Dog)"
    "Roars mightily (Lion)"
    "Mooing in the field (Cow)"
    "Bleats while jumping (Goat)"
    "Quacks near the pond (Duck)"
    "Hoots in the night (Owl)"
    "Chirps in the morning (Bird)"
    "Buzzes around the flowers (Bee)"
    "Neighs gallantly (Horse)"
  )

  # Randomly select a sound
  selected_sound=${sounds[$((RANDOM % ${#sounds[@]}))]}
  sound_description=$(echo "$selected_sound" | cut -d '(' -f1)
  sound_answer=$(echo "$selected_sound" | cut -d '(' -f2 | tr -d ')')

  # Display the sound description
  echo -e "${BOLD_YELLOW}What animal makes this sound? ${RESET}${MAGENTA}$sound_description${RESET}"
  echo -e -n "${BOLD_YELLOW}Your answer: ${RESET}"
  read player_answer

  # Check the player's answer
  if [[ "${player_answer,,}" == "${sound_answer,,}" ]]; then
    echo -e "${GREEN}Correct! The answer is: $sound_answer.${RESET}"
  else
    echo -e "${RED}Wrong! The correct answer is: $sound_answer.${RESET}"
  fi

  # Return to main menu
  main_menu
}


# Start the program
main_menu
