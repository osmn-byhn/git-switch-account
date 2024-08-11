Here is the content in full Markdown format:

```md
# GitHub Account Switcher Script

This simple shell script allows you to quickly switch between different GitHub accounts by changing the global Git user name and email address. It's useful when you work with multiple GitHub accounts on the same machine.

## Features

- Switch between multiple GitHub accounts with ease.
- Automatically updates the global Git user name and email configuration.

## Prerequisites

- Ensure you have Git installed on your system.
- Ensure the script has execution permissions.

## Setup

### 1. Clone the repository or copy the script to your local machine.

### 2. Modify the Script:

Open the `switch-github-account.sh` file and replace the placeholders with your actual GitHub usernames and email addresses.

```sh
ACCOUNT1_NAME="username1"
ACCOUNT1_EMAIL="email1@example.com"

ACCOUNT2_NAME="username2"
ACCOUNT2_EMAIL="email2@example.com"
```

### 3. Make the script executable:

Run the following command in your terminal to give the script execution permissions:

```sh
chmod +x switch-github-account.sh
```

## Usage

### 1. Run the script:

```sh
./switch-github-account.sh
```

### 2. Select the GitHub account:

When prompted, enter the number corresponding to the GitHub account you want to switch to.

Example:

```
Select a GitHub account:
1) username1
2) username2
Your choice: 1
```

### 3. Confirm the switch:

The script will update your global Git configuration and confirm the switch with a message:

```
Switched to username1 (email1@example.com)
```
