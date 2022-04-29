#!/bin/bash

# mutt
echo "### mutt ###"
echo "> Enter email:"
read -r muttemail
echo "> Enter your password or generate it with https://myaccount.google.com/apppasswords:"
read -r muttpswd
echo "> Enter your first and last name:"
read -r muttname

sed -i "s/MAIL@gmail.com/$muttemail/g" ./.muttrc
sed -i "s/MYPASSWORD/$muttpswd/g" ./.muttrc
sed -i "s/FName LName/$muttname/g" ./.muttrc

# .gitconfig
echo "### .gitconfig ###"
echo "> Enter signingkey:"
read -r signingkey
sed -i "s/SIGNINGKEY/$signingkey/g" ./.gitconfig
