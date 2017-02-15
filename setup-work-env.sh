#!/bin/bash

# stop the script on any error 
set -e 

echo "Enter your working directory or hit Enter for default (~/workspace)"
read dir_path
dir_path=${dir_path:-"~/workspace"}

# refactor user's' input to expand tilde. !!!NEVER eval user's input!!!
dir_path=${dir_path/#\~/$HOME}

mkdir -p $dir_path
mkdir -p $dir_path/my-error-log

if [[ -d "$dir_path" ]]; then
  echo "YAY 1! Your directory is ready: $dir_path"
fi

brew install -g n

git clone https://github.com/aganita/initial-profile-setup.git $dir_path/initial-profile-setup
  echo "YAY 2! Your profile files are cloned to: $dir_path"
  
npm install -g n
brew install curl

ln -sf  $dir_path/initial-profile-setup/bash/.bash_profile $HOME/.bash_profile

# install and setup zsh themes oh-my-zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -sf $dir_path/initial-profile-setup/zshell/.zshrc $HOME/.zshrc

ln -sf $dir_path/initial-profile-setup/.my_aliases $HOME/.my_aliases
touch $HOME/.set_my_exports

npm install -g nodemon
npm install -g webpack
