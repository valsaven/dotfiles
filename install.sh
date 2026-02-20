#!/bin/bash

# Function for clean status messages
log() {
  echo -e "\033[1;34m$1\033[0m"
}

# --- mutt ---
log "### Configuring mutt ###"

if [ -f ./.muttrc ]; then
  read -p "> Enter your email: " muttemail

  # Secure password input (hidden)
  echo -n "> Enter your app password or generate it with https://myaccount.google.com/apppasswords (chars will be hidden): "
  read -s muttpswd
  echo ""

  read -p "> Enter your First and Last Name: " muttname

  # Using | as a delimiter in sed to handle special characters in passwords
  sed -i "s|MAIL@gmail.com|$muttemail|g" ./.muttrc
  sed -i "s|MYPASSWORD|$muttpswd|g" ./.muttrc
  sed -i "s|FName LName|$muttname|g" ./.muttrc
  log "✔ .muttrc updated successfully."
else
  echo "⚠ Warning: .muttrc not found. Skipping."
fi

echo ""

# --- .gitconfig ---
log "### Configuring .gitconfig ###"

if [ -f ./.gitconfig ]; then
  read -p "> Enter your GPG signingkey: " signingkey
  if [ -n "$signingkey" ]; then
    sed -i "s|SIGNINGKEY|$signingkey|g" ./.gitconfig
    log "✔ .gitconfig updated successfully."
  else
    echo "Skipped: no key provided."
  fi
else
  echo "⚠ Warning: .gitconfig not found."
fi

log "\nSetup complete! Reminder: Keep your config files with passwords out of public repositories."
