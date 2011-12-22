bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

# C-x C-e
autoload edit-command-line
zle -N edit-command-line
bindkey '^X^e' edit-command-line

zmodload -i zsh/deltochar
bindkey '^[^w' zap-to-char

bindkey '^[^f' vi-find-next-char
bindkey '^[^b' vi-find-prev-char

bindkey '^[[1;5C' forward-word 
bindkey '^[[1;5D' backward-word

#bindkey -s '^[j' 'jobs\n'
