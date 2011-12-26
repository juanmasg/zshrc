autoload read-from-minibuffer

regex-edit() {
   local REPLY words 
   words=(${=BUFFER})
   read-from-minibuffer "Regexp: "
   [[ -z $REPLY ]] && return 0
   if [[ "${REPLY}" =~ '^.?/.*/.?$' ]]; then
       BUFFER="$( echo $words | sed ${REPLY} 2>/dev/null )"
   else
       setopt sh_word_split
       args=(${REPLY})
       unsetopt sh_word_split
       BUFFER="$( echo $words | sed s/$args[1]/$args[2]/g 2>/dev/null )"
   fi
 }

zle -N regex-edit 
bindkey "^[," regex-edit 
