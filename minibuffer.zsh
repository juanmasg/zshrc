autoload read-from-minibuffer

regex-edit() {
   local REPLY words 
   words=(${=BUFFER})
   read-from-minibuffer "Regexp: "
   [[ -z $REPLY ]] && return 0
 #  BUFFER="$words[1] $(echo $words[2,${#words}] | sed ${REPLY})"
   BUFFER=" $( echo $words | sed ${REPLY} 2>/dev/null )"
 }

zle -N regex-edit 
bindkey "^[," regex-edit 
