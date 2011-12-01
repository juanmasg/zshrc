#WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

custom-backward-kill-word(){
	if [[ $LASTWIDGET = *kill* ]]; then
		TMPBUFFER=$CUTBUFFER
	else
		TMPBUFFER=""
	fi
	local WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
	zle backward-kill-word 
	CUTBUFFER="$CUTBUFFER$TMPBUFFER"
}

zle -N custom-backward-kill-word

bindkey "^w" custom-backward-kill-word
