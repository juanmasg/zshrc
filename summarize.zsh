summarize(){
	local total=0
	while read line; do (( total = $total + $line )); done
	echo $total
}
