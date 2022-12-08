#! /usr/bin/bash

input="/home/ubuntu/Shell/names.csv"
declare -a user
declare -a pass

while IFS=, read -r FirstName Password;
do
     
	user+=("$FirstName")
        pass+=("$Password")

done<$input

for index in "${!user[@]}";
do
	sudo useradd -g "developers" \
                     -m -d "/home/${user[$index]}" \
                     -s "/bin/bash" \
                     -p "$(echo "${pass[$index]}" | openssl passwd -1 -stdin)" "${user[$index]}"
             done
