jobselect() {
#	read -k 1 "argno?job: "
	read -k 1 argno

    case $argno in
        0)
            BUFFER="jobs"
        ;;
        "^]")
            #BUFFER="fg"
            joblist
        ;;
        [0-9])
            BUFFER="fg $argno"
        ;;
        *)
            echo "\nNo such job: $argno"
            return
        ;;
    esac

    zle .accept-line
	return
}

joblist() {
    case ${#jobstates} in
        0)
            #echo "\nNo background jobs."
            return
        ;;
        1)
            BUFFER="fg"
        ;;
        *)
            BUFFER="jobs"
        ;;
    esac
    zle .accept-line
}

zle -N jobselect
zle -N joblist
bindkey '^[j' jobselect
bindkey '^[j^[j' joblist
