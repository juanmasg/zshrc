alias cp='cp -v'
alias rcp='rsync -v --progress'
alias rmv='rsync -v --progress --remove-source-files'
alias mv='mv -v'
alias rm='rm -v'
alias chmod="chmod -c"
alias chown="chown -c"

if which colordiff > /dev/null 2>&1; then
alias diff="colordiff -Nuar"
else
alias diff="diff -Nuar"
fi

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
eval `dircolors`
alias ls='ls --color=auto --group-directories-first'
alias l='ls -l --color=auto --group-directories-first'

# Custom aliases
alias .='source'
# End custom aliases
