# historial arriba y abajo busca en base a lo que hay escrito (como vim)
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
