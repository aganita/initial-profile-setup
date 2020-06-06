#!/usr/bin/env bash

set -e # stop if error 
set -x # verbose installation

echo "Enter your working directory. Hit Enter for default setting (~/workspace)"
read dir_path
dir_path=${dir_path:-"~/workspace"}

dir_path=${dir_path/#\~/$HOME}

mkdir -p $dir_path

if [[ ! -d $dir_path/my-profile ]]; then
  git clone https://github.com/aganita/my-profile.git $dir_path/my-profile
fi

ln -sf $dir_path/my-profile/bash/.bash_profile $HOME/.bash_profile
ln -sf $dir_path/my-profile/settings/.my_aliases $HOME/.my_aliases
ln -sf $dir_path/my-profile/settings/.my_exports $HOME/.my_exports

brew install zsh
ln -sf $dir_path/my-profile/zshell/.zshrc $HOME/.zshrc

read -p "Rebind Caps Lock key to Ctrl and Enter to continue"

read -p "Install iTerm2 and press Enter to continue"
ln -sf $dir_path/my-profile/settings/com.googlecode.iterm2.plist $HOME/Library/Preferences/com.googlecode.iterm2.plist

read -p "Install VSCodium and press Enter to continue"
rm $HOME/Library/Application\ Support/VSCodium/User/settings.json
ln -sf $dir_path/my-profile/settings/vsc-settings.json $HOME/Library/Application\ Support/VSCodium/User/settings.json

read -p "Install font Meslo LG M DZ Regular for Powerline"

read -p "Install NodeJS browser and press Enter to continue"

read -p "Install Brave browser and press Enter to continue"
read -p "Copy over bookmarks for Brave and press Enter to continue"

read -p "Install Chrome browser and press Enter to continue"

 

