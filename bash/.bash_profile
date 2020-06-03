DEFAULT_USER=`whoami`
export PS1="☯ ${DEFAULT_USER}$ "

if [ -f ~/.my_aliases ]; then
    . ~/.my_aliases
fi

if [ -f ~/.my_exports ]; then
    . ~/.my_exports
fi
