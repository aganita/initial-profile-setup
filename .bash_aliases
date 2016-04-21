alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ll='ls -ltraG'
alias pwd='pwd -P'
alias grep='grep --color=auto'
alias gac='git commit -a -m'

#detect the OS
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='mac'
fi

# platform specific aliases
if [[ $platform == 'linux' ]]; then
   alias subl='~/workspace/tools/sublime_text_2/sublime_text'
   alias ls='ls --color=auto'
elif [[ $platform == 'mac' ]]; then
   alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
   alias ls='ls -G'
fi
