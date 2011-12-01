#function zle-keymap-select {
#	VIMODE="${${KEYMAP/vicmd/}/(main|viins)/}"
#	zle reset-prompt
#}
#zle -N zle-keymap-select


switch-editing-mode(){
	if  [[ "`set -o | egrep '^vi.*on'`" != "" || "$KEYMAP" = "vicmd" ]]; then
		#print emacs\!
		set -o emacs
		RPS1=""
		RPS2=""
		zle reset-prompt
		zle redisplay
		#print "Switching to emacs."
	else
		set -o vi
#		vi-cmd-mode
		bindkey '^R' history-incremental-search-backward
		RPS1="${${KEYMAP/vicmd/-- COMMAND --}/(main|viins)/-- INSERT --}"
		RPS2=$RPS1
		zle reset-prompt
		zle redisplay
		#print "Switching to vim."
	fi
}

zle -N switch-editing-mode

function zle-line-init zle-keymap-select {
#	print $KEYMAP
	if  [[ "`set -o | egrep '^vi.*on'`" != "" || "$KEYMAP" = "vicmd" ]]; then
		RPS1="${${KEYMAP/vicmd/-- COMMAND --}/(main|viins)/-- INSERT --}"
		RPS2=$RPS1
	fi
    zle reset-prompt
	zle redisplay
}

zle -N zle-line-init
zle -N zle-keymap-select


bindkey '^[e' switch-editing-mode
bindkey '\M-e' switch-editing-mode
#bindkey '\M-e' vi-cmd-mode  
bindkey -M vicmd '^[e' switch-editing-mode
bindkey -M vicmd '\M-e' switch-editing-mode
