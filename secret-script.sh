#!bin/bash

#secret.txt.enc - encrypted
#user enter password [qwerty]
#secret.txt.enc - decrypts
#user guesses the number in the secret.txt

echo -e "\n 					Hello, User!"
echo "				Please, enter the password"

read pswd
openssl enc -aes-256-cbc -d -in secret.txt.enc -out secret-new.txt -iter 100000 -k "$pswd"
guess_num=`cat secret-new.txt`
rm secret-new.txt

clear
echo "					[ GUESS NUMBER ]"
while true; do
#*************
  read user_num
  if (( "$user_num" == "$guess_num" )); then
    echo "[ YOU GUESSED! ]"
    break
  else
    echo "[ NO! ]"
    if (( "$user_num" > "$guess_num" )); then
      echo "***Help: Your number is higher***"
    else
      echo "***Help: Your number is less***"
    fi
  fi
#*************
done

echo -e "\n"
