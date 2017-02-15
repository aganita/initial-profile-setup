#!/bin/bash

# stop the script on any error 
set -e 

echo "Enter your working directory or hit Enter for default (~/workspace)"
read dir_path
dir_path=${dir_path:-"~/workspace"}

# refactor user's' input to expand tilde. !!!NEVER eval user's input!!!
dir_path=${dir_path/#\~/$HOME}

# create the main working directory and directory for log files
mkdir -p $dir_path
mkdir -p $dir_path/my-error-log

# check if the directory is created
if [[ -d "$dir_path" ]]; then
  echo "YAY 1! Your directory is ready: $dir_path"
fi

# check for node and install stable version
brew install -g n

# create and clone all of the respective repos
git clone https://github.com/aganita/profile-files.git $dir_path/profile-files
  echo "YAY 2! Your projects are cloned to: $dir_path"

# install node version control
npm install -g n

# install nodemon and webpack
npm install -g nodemon
npm install -g webpack

# write node_env to shell profile
shellProfile='unknown'
if [[ $SHELL == "/bin/zsh" ]]; then
  echo "zsh"
  shellProfile=~/.zshrc
elif [[ $SHELL == "/bin/bash" ]]; then
  echo "bash"
  shellProfile=~/.bash_profile
fi

echo export NODE_ENV="development" >> $shellProfile
source $shellProfile