incognito(){
	case "$1" in
		off)
			HISTFILE=$oldHISTFILE
			SAVEHIST=$oldSAVEHIST
			PROMPT=$oldPROMPT

			oldHISTSIZE=$HISTSIZE
			HISTSIZE=0
			HISTSIZE=$oldHISTSIZE

			unset oldHISTFILE oldSAVELIST oldPROMPT oldHISTSIZE
			unsetopt ignoreeof
			setopt sharehistory
			setopt appendhistory
		;;
		*)
			oldHISTFILE=$HISTFILE
			oldSAVEHIST=$SAVEHIST
			oldPROMPT=$PROMPT

			SAVEHIST=0
			HISTFILE=/dev/null
			PROMPT='%B%F{red%}@_@ %~ %#%b%f%k '
			setopt ignoreeof
			unsetopt sharehistory
			unsetopt appendhistory
		;;
	esac
}
