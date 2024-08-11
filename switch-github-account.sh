#!/bin/sh

# GitHub account usernames and email addresses
ACCOUNT1_NAME="username1"
ACCOUNT1_EMAIL="email1@example.com"

ACCOUNT2_NAME="username2"
ACCOUNT2_EMAIL="email2@example.com"

# Prompt the user to select an account
echo "Select a GitHub account:"
echo "1) $ACCOUNT1_NAME"
echo "2) $ACCOUNT2_NAME"
read -p "Your choice: " choice

# Change Git settings based on the selection
case $choice in
  1)
    git config --global user.name "$ACCOUNT1_NAME"
    git config --global user.email "$ACCOUNT1_EMAIL"
    echo "Switched to $ACCOUNT1_NAME ($ACCOUNT1_EMAIL)"
    ;;
  2)
    git config --global user.name "$ACCOUNT2_NAME"
    git config --global user.email "$ACCOUNT2_EMAIL"
    echo "Switched to $ACCOUNT2_NAME ($ACCOUNT2_EMAIL)"
    ;;
  *)
    echo "Invalid choice!"
    ;;
esac
