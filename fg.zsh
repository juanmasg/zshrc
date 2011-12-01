fg(){
	if test ${#jobstates} -gt 0; then
		builtin fg %$1
	else
		echo "fg: no current job"
	fi
}
