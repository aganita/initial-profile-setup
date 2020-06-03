#!/usr/bin/env bash

set -e # stop if error 
set -x # verbose installation

echo "Enter your working directory or hit Enter for default (~/workspace)"
read dir_path
dir_path=${dir_path:-"~/workspace"}

dir_path=${dir_path/#\~/$HOME}

mkdir -p $dir_path

if [[ ! -d $dir_path/my-profile ]]; then
  git clone https://github.com/aganita/my-profile.git $dir_path/my-profile
fi

ln -sf  $dir_path/my-profile/bash/.bash_profile $HOME/.bash_profile
ln -sf  $dir_path/my-profile/settings/.my_aliases $HOME/.my_aliases
ln -sf  $dir_path/my-profile/settings/.my_exports $HOME/.my_exports

brew install zsh
ln -sf  $dir_path/my-profile/zshell/.zshrc $HOME/.zshrc

# install iterm2
ln -sf  $dir_path/my-profile/settings/com.googlecode.iterm2.plist $HOME/Library/Preferences/com.googlecode.iterm2.plis

# install vc code
# ln -sf  $dir_path/my-profile/settings/vsc-settings.json $HOME/Library/Application Support/Code/User/settings.json
