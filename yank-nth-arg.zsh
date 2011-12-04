yank-nth-arg() {
	local line="${history[${#history}]}"
	zle -U ${${(z)line}[2]}
}

zle -N yank-nth-arg 
bindkey "^[^y" yank-nth-arg
