#!/bin/zsh

# Apple script to turn on dark mode
osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to dark mode'

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

# install brew casks
xargs brew install --cask < brew-casks.txt

# install brew formulae
xargs brew install --formulae < brew-formulae.txt

### Git setup
# Add username and email for github
git config --add --global user.name $username
git config --add --global user.email $email
# Change default branch name to main to match github
git config --global init.defaultBranch main
# Set pull to repase to maintain a linear history 
git config --global pull.rebase true

# Open Tabs for chrome and gcal and gmail for adding to dock
open -a Safari 'https://mail.google.com' 'https://calendar.google.com'

# Install uv package
pip install uv