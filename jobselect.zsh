jobselect() {
#	read -k 1 "argno?job: "
	read -k 1 argno
	
	if [[ $argno = 0 ]]; then
        BUFFER="jobs"
    else
        BUFFER="fg %$argno"
    fi
    zle .accept-line
	return
}

zle -N jobselect
bindkey '^[j' jobselect
