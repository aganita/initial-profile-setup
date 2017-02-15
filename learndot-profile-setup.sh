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


# create and clone all of the respective repos
git clone https://github.com/aganita/profile-files.git $dir_path/profile-files
  echo "YAY 2! Your projects are cloned to: $dir_path"


# # get learndot required node version from the package.json
# node_learndot=$(cat $dir_path/newlearn/package.json \
#   | grep -w '"node":' \
#   | head -1 \
#   | awk -F: '{ print $2 }' \
#   | sed 's/[",]//g' \
#   | tr -d '[[:space:]]')

# # check user's node version, and update accordingly
# node_user=`node -v` 
# node_user=${node_user:1} 
# if [[ "$node_user" != "$node_learndot" ]]; then
#   hasn=`type n` || true # added || true to ignore error ad bypass set -e
#   hasnvm=`type nvm` || true # added || true to ignore error ad bypass set -e
#   if [[ "$hasn" =~ "n is" ]]; then
#     n $node_learndot
#   elif [[ "$hasnvm" =~ "nvm is" ]]; then
#     nvm install $node_learndot
#     nvm use $node_learndot
#   else
#     npm install -g n
#     n $node_learndot
#   fi
# fi

# # check environment and install redis and mongo accordingly, and store username
# sudo chown -R $(whoami):admin /usr/local
# sudo mkdir -p /data/db
# sudo chown $(whoami) /data/db

# unamestr=`uname`
# brewtype=`type brew`
# if [[ "$unamestr" == 'Darwin' ]]; then
#   if [[ "$brewtype" != "brew is /usr/local/bin/brew" ]]; then
#     /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#   fi
#   # if these versions of mongo and redis don't work, try mongo 3.2.6 and redis 3.2.0
#   brew install mongodb redis
#   echo "darwin"
# elif [[ "$unamestr" == 'Linux' ]]; then
#   sudo apt-get update
#   # curl figure out later
#   echo "linux"
# fi

# # start redis and mongodb
# redis-server >> $dir_path/my-error-log/.learndot_redis.log &
# mongod >> $dir_path/my-error-log/.learndot_mongo.log &

# # configure mongo and redis to launch on start up
# ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
# ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents

# # install nodemon and webpack
# # maybe in the future not globally
# npm install -g nodemon
# npm install -g webpack

# cd $dir_path/learndot && npm install
# cd $dir_path/learndot-seed && npm install && npm link && learnDb --seed
# cd $dir_path/help-desk && npm install
# cd $dir_path/fs-data && npm install

# # write node_env to shell profile
# shellProfile='unknown'
# if [[ $SHELL == "/bin/zsh" ]]; then
#   echo "zsh"
#   shellProfile=~/.zshrc
# elif [[ $SHELL == "/bin/bash" ]]; then
#   echo "bash"
#   shellProfile=~/.bash_profile
# fi
# # if we want to work for linux also, need another elif, writing to ~/.bashrc

# echo export NODE_ENV="development" >> $shellProfile
# echo alias buildFSData="'cd $dir_path/fs-data && webpack && cp -rf build.js $dir_path/learndot/node_modules/fs-data && cp -rf build.js $dir_path/help-desk/node_modules/fs-data'" >> $shellProfile
# echo alias buildHelpDesk="'cd $dir_path/help-desk && webpack && cp public/bundle.js $dir_path/learndot/node_modules/help-desk/public/bundle.js'" >> $shellProfile
# source $shellProfile


# echo "Now get the environment variables from someone, and place them in $dir_path/newlearn/server/config/local.env.js"
