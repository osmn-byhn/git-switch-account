#!/bin/sh

# Config file path
CONFIG_FILE="$HOME/.github_accounts"

# Load existing accounts if the config file exists
if [ -f "$CONFIG_FILE" ]; then
  . "$CONFIG_FILE"
else
  # Create an empty config file if it doesn't exist
  touch "$CONFIG_FILE"
fi

# Function to list all accounts
list_accounts() {
  echo "Available GitHub accounts:"
  grep -oP '^ACCOUNT\d+_NAME="\K[^"]+' "$CONFIG_FILE" | nl -v 1
}

# Function to add a new account
add_account() {
  account_number=$(grep -c '^ACCOUNT\d+_NAME' "$CONFIG_FILE")
  new_account_number=$((account_number + 1))

  read -p "Enter GitHub username: " new_name
  read -p "Enter GitHub email: " new_email

  echo "ACCOUNT${new_account_number}_NAME=\"$new_name\"" >> "$CONFIG_FILE"
  echo "ACCOUNT${new_account_number}_EMAIL=\"$new_email\"" >> "$CONFIG_FILE"

  echo "Account $new_name ($new_email) added successfully!"
}

# Function to delete an account
delete_account() {
  list_accounts
  read -p "Select an account to delete by number: " choice
  account_name=$(grep -oP "^ACCOUNT${choice}_NAME=\"\K[^\"]+" "$CONFIG_FILE")
  account_email=$(grep -oP "^ACCOUNT${choice}_EMAIL=\"\K[^\"]+" "$CONFIG_FILE")

  if [ -z "$account_name" ] || [ -z "$account_email" ]; then
    echo "Invalid choice!"
    exit 1
  fi

  sed -i "/^ACCOUNT${choice}_NAME=\"${account_name}\"/d" "$CONFIG_FILE"
  sed -i "/^ACCOUNT${choice}_EMAIL=\"${account_email}\"/d" "$CONFIG_FILE"

  echo "Deleted account $account_name ($account_email)"
}

# Function to update an account
update_account() {
  list_accounts
  read -p "Select an account to update by number: " choice
  account_name=$(grep -oP "^ACCOUNT${choice}_NAME=\"\K[^\"]+" "$CONFIG_FILE")
  account_email=$(grep -oP "^ACCOUNT${choice}_EMAIL=\"\K[^\"]+" "$CONFIG_FILE")

  if [ -z "$account_name" ] || [ -z "$account_email" ]; then
    echo "Invalid choice!"
    exit 1
  fi

  echo "Updating account $account_name ($account_email)"
  read -p "Enter new GitHub username (leave blank to keep current): " new_name
  read -p "Enter new GitHub email (leave blank to keep current): " new_email

  if [ -n "$new_name" ]; then
    sed -i "s/^ACCOUNT${choice}_NAME=\"${account_name}\"/ACCOUNT${choice}_NAME=\"${new_name}\"/" "$CONFIG_FILE"
  fi

  if [ -n "$new_email" ]; then
    sed -i "s/^ACCOUNT${choice}_EMAIL=\"${account_email}\"/ACCOUNT${choice}_EMAIL=\"${new_email}\"/" "$CONFIG_FILE"
  fi

  echo "Account updated successfully!"
}

# Prompt the user for action
echo "Choose an option:"
echo "1) Switch GitHub account"
echo "2) Add a new GitHub account"
echo "3) Delete a GitHub account"
echo "4) Update a GitHub account"
read -p "Your choice: " action

case $action in
  1)
    list_accounts
    read -p "Select an account by number: " choice
    account_name=$(grep -oP "^ACCOUNT${choice}_NAME=\"\K[^\"]+" "$CONFIG_FILE")
    account_email=$(grep -oP "^ACCOUNT${choice}_EMAIL=\"\K[^\"]+" "$CONFIG_FILE")

    if [ -z "$account_name" ] || [ -z "$account_email" ]; then
      echo "Invalid choice!"
      exit 1
    fi

    git config --global user.name "$account_name"
    git config --global user.email "$account_email"
    echo "Switched to $account_name ($account_email)"
    ;;
  2)
    add_account
    ;;
  3)
    delete_account
    ;;
  4)
    update_account
    ;;
  *)
    echo "Invalid choice!"
    ;;
esac
