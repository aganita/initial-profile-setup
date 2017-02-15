# Alias definitions.
# Save all aliases in ~/.bash_aliases

if [ -f ~/.my_aliases ]; then
    . ~/.my_aliases
fi

if [ -f ~/.set_my_exports ]; then
    . ~/.set_my_exports
fi

# TO DO write script that will deploy my files to git and webhostign server 
