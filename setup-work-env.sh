#!/usr/bin/env bash

# stop the script on any error 
set -e
# print out each step
set -x

echo "Enter your working directory or hit Enter for default (~/workspace)"
read dir_path
dir_path=${dir_path:-"~/workspace"}

dir_path=${dir_path/#\~/$HOME}

mkdir -p $dir_path

if [[ ! -d $dir_path/initial-profile-setup ]]; then
  git clone https://github.com/aganita/initial-profile-setup.git $dir_path/initial-profile-setup
fi

ln -sf  $dir_path/initial-profile-setup/bash/.bash_profile $HOME/.bash_profile
ln -sf  $dir_path/initial-profile-setup/assets/.my_aliases $HOME/.my_aliases
ln -sf  $dir_path/initial-profile-setup/assets/.my_exports $HOME/.my_exports

brew install zsh
ln -sf  $dir_path/initial-profile-setup/zshell/.zshrc $HOME/.zshrc

