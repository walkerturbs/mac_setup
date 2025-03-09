#!/bin/zsh

# Taking inputs for later github setup
read -p "Enter your github username: " username
read -p "Enter your email: " email

# Install Oh My Zsh silently (avoid breaking the script)
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add brew to path
export PATH="/opt/homebrew/bin:$PATH"
source ~/.zshrc

# Install neovim
brew install neovim

# Install tmux
brew install tmux

# Install Python
brew install python3

# Install Git
brew install git

#Install Github cli
curl -sS https://webi.sh/gh | sh

### Git setup
# Add username and email for github
git config --add --global user.name $username
git config --add --global user.email $email
# Change default branch name to main to match github
git config --global init.defaultBranch main
# Set pull to repase to maintain a linear history 
git config --global pull.rebase true

# Open Tabs for download vscode and chrome and gcal and gmail for adding to dock
open -a Safari 'https://mail.google.com' 'https://calendar.google.com' 'https://code.visualstudio.com' 'https://www.google.com/chrome/'