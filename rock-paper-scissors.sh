#!bin/bash

echo -e "\n				    Hello dear user!"
echo "				  Let's start the game"

while true; do
#User
  echo -e "\nPlease, enter your choice:"
  read choiceUser
#Linux
  game=$((RANDOM%100))
  #standart
  choiceLinux=$((RANDOM%3))  
  if [[ "$game" > "56" ]]; then
    if [[ "$choiceLinux" = 0 ]]; then
      choiceLinux="rock"
    elif [[ "$choiceLinux" = 1 ]]; then
      choiceLinux="paper"
    elif [[ "$choiceLinux" = 2 ]]; then
      choiceLinux="scissors"
    fi
  fi
  #scam
  if [[ "$game" -le "56" ]]; then
    if [[ "$choiceUser" = "scissors" ]]; then
      choiceLinux="rock"
    elif [[ "$choiceUser" = "rock" ]]; then
      choiceLinux="paper"
    elif [[ "$choiceUser" = "paper" ]]; then
      choiceLinux="scissors"
    fi
  fi
  
#You lose
  if [[ "$choiceLinux" = "rock" ]] && [[ "$choiceUser" = "scissors" ]]; then
    echo "You lose!"
  elif [[ "$choiceLinux" = "paper" ]] && [[ "$choiceUser" = "rock" ]]; then
    echo "You lose!"
  elif [[ "$choiceLinux" = "scissors" ]] && [[ "$choiceUser" = "paper" ]]; then
    echo "You lose!"
#You win
  elif [[ "$choiceLinux" = "rock" ]] && [[ "$choiceUser" = "paper" ]]; then
    echo "You win!"
  elif [[ "$choiceLinux" = "paper" ]] && [[ "$choiceUser" = "scissors" ]]; then
    echo "You win!"
  elif [[ "$choiceLinux" = "scissors" ]] && [[ "$choiceUser" = "rock" ]]; then
    echo "You win!"
#Draw
  elif [[ "$choiceLinux" = "rock" ]] && [[ "$choiceUser" = "rock" ]]; then
    echo "Draw"
  elif [[ "$choiceLinux" = "paper" ]] && [[ "$choiceUser" = "paper" ]]; then
    echo "Draw"
  elif [[ "$choiceLinux" = "scissors" ]] && [[ "$choiceUser" = "scissors" ]]; then
    echo "Darw"

#Exit
  elif [[ "$choiceUser" = "exit" ]]; then
    echo -e "Goodbye!\n"
    exit
  fi

done
