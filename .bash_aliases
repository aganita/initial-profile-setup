alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ll='ls -ltraG'
alias pwd='pwd -P'

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='mac'
fi

if [[ $platform == 'linux' ]]; then
   alias sublime='~/workspace/tools/sublime_text_2/sublime_text'
elif [[ $platform == 'mac' ]]; then
   alias sublime='/Applications/sublime_text_2.app/Contents/SharedSupport/bin/subl'
fi
