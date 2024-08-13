Certainly! Here's the README.md in English:

```markdown
# Switch GitHub Account

`switcher-github.sh` is a tool that allows you to quickly switch between GitHub accounts, add new accounts, delete existing ones, and update account information.

## Features

- Easily switch between accounts by setting the GitHub username and email address.
- Add new GitHub accounts.
- Delete or update existing accounts.
- Accounts are stored in a configuration file located in your home directory.

## Installation

### 1. Install as a Debian Package

A `.deb` package is available for this tool, making it easy to use on Debian-based systems.

1. Download and install the package:

    ```sh
    sudo dpkg -i switch-github-account-1.0.deb
    ```

2. Start using the script by running:

    ```sh
    switcher-github.sh
    ```

### 2. Manual Installation

Alternatively, you can install the script manually:

1. Move the script to a suitable directory:

    ```sh
    cp switcher-github.sh /usr/local/bin/switcher-github.sh
    chmod +x /usr/local/bin/switcher-github.sh
    ```

2. Run the script from the terminal:

    ```sh
    switcher-github.sh
    ```

## Usage

When you run the script, you'll be prompted with the following options:

1. **Switch GitHub account:** Allows you to switch between existing accounts.
2. **Add a new GitHub account:** Allows you to add a new account with a username and email.
3. **Delete a GitHub account:** Deletes one of the existing accounts.
4. **Update a GitHub account:** Updates the username or email of an existing account.

The script stores account information in a `.github_accounts` file in your home directory.

## Configuration File

The script stores usernames and email addresses in the `$HOME/.github_accounts` file. The format of the file is as follows:

```sh
ACCOUNT1_NAME="username1"
ACCOUNT1_EMAIL="email1@example.com"
ACCOUNT2_NAME="username2"
ACCOUNT2_EMAIL="email2@example.com"
...
```

## Building the Package

If you want to create a Debian package for this script:

1. Create the necessary directory structure:

    ```sh
    mkdir -p switch-github-account-1.0/usr/local/bin
    ```

2. Copy the script to the appropriate directory:

    ```sh
    cp switcher-github.sh switch-github-account-1.0/usr/local/bin/
    chmod +x switch-github-account-1.0/usr/local/bin/switcher-github.sh
    ```

3. Create a `DEBIAN` directory and add a `control` file:

    ```sh
    mkdir switch-github-account-1.0/DEBIAN
    ```

    Content of the `control` file:

    ```plaintext
    Package: switch-github-account
    Version: 1.0
    Section: utils
    Priority: optional
    Architecture: all
    Depends: bash
    Maintainer: Your Name <your.email@example.com>
    Description: A simple tool to switch GitHub accounts using a configuration file.
    ```

4. Build the Debian package:

    ```sh
    dpkg-deb --build switch-github-account-1.0
    ```

5. Install the package:

    ```sh
    sudo dpkg -i switch-github-account-1.0.deb
    ```

## Contributing

We welcome contributions! If you have any suggestions or issues, please open an [issue](https://github.com/osmn-byhn/git-switch-account/issues) or submit a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.
```

This README.md file provides instructions on how to use the `switcher-github.sh` script, install it as a Debian package, and contribute to the project. It's now written in English for broader accessibility.
