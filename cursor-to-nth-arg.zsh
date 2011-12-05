cursor-to-nth-arg() {
#	argno=$NUMERIC
	read -k 1 argno
#	local var="${${(z)BUFFER}[1,$(($NUMERIC - 1))]}"
#	CURSOR=${#var}
	
	if [[ $argno = 1 ]]; then
		CURSOR=0
		return
	fi

	local total_args=1
	for i in $(seq 0 ${#BUFFER}); do
		if [[ ${BUFFER[$i]} = " " ]]; then
			if [[ ${BUFFER[$(($i + 1))]} = " " ]]; then
				continue
			fi
			total_args=$(( $total_args + 1 ))
			if [[ $total_args = $argno ]]; then
				CURSOR=$i
				return
			fi
		else
		fi
	done
}

zle -N cursor-to-nth-arg
#bindkey "^[[1;5D" cursor-to-nth-arg 
bindkey "^[^g" cursor-to-nth-arg 
