#!/bin/zsh

# Apple script to turn on dark mode
osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'

# Taking inputs for later github setup
read -p "Enter your github username: " username
read -p "Enter your email: " email
read -p "Is this a work laptop (y/n) " work

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add brew to path
export PATH="/opt/homebrew/bin:$PATH"
source ~/.zshrc

# install brew casks
cat brew-casks.txt | xargs brew install --cask

# install brew formulae
cat brew-formulae.txt | xargs brew install --formulae

# Install Oh My Zsh silently (avoid breaking the script)
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc

### Git setup
# Add username and email for github
git config --add --global user.name $username
git config --add --global user.email $email
# Change default branch name to main to match github
git config --global init.defaultBranch main
# Set pull to repase to maintain a linear history 
git config --global pull.rebase true

# Download anonymous pro font
wget -P ~/Downloads https://www.marksimonson.com/assets/content/fonts/AnonymousProMinus-1_003.zip

# Unzip the font files to the font library
unzip -j ~/Downloads/AnonymousProMinus-1_003.zip "AnonymousProMinus-1_003/Anonymous Pro Minus B.ttf" "AnonymousProMinus-1_003/Anonymous Pro Minus BI.ttf" "AnonymousProMinus-1_003/Anonymous Pro Minus I.ttf" "AnonymousProMinus-1_003/Anonymous Pro Minus.ttf" -d ~/Library/Fonts/

# Cleanup and delete the downloaded zip files
rm ~/Downloads/AnonymousProMinus-1_003.zip

echo 'eval "$(uv generate-shell-completion zsh)"' >> ~/.zshrc
echo 'eval "$(uvx --generate-shell-completion zsh)"' >> ~/.zshrc

# Open Tabs for chrome and gcal and gmail for adding to dock
open -a Safari 'https://mail.google.com' 'https://calendar.google.com'

# If work then also open tab for gcloud sdk
if [[ "$work" == "Y" || "$work" == "y" ]]; then
    open -a Safari "https://cloud.google.com/sdk/docs/install-sdk"
fi 

# Add vscode to path
cat << EOF >> ~/.zprofile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF
source ~/.zshrc


cat vs_code_extensions_list.txt | xargs -L1 code --install-extension
