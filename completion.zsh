# Completion.
autoload -Uz compinit
compinit

# Correccion mayusc -> minusc
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _ignored #_approximate 
#zstyle ':completion:*:approximate:*' max-errors 2 
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
# completar / al final de los directorios
zstyle ':completion:*' special-dirs true

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache 

zstyle ':completion:*' show-completer 'true' 

#Completing process IDs with menu selection:
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'
zstyle ':completion:matches' group 'yes'

# pager cuando menucomp no cabe en pantalla
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

