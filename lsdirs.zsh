lsdirs(){
#	local dir=${1:-.} # si dir es nulo, se sustituye por "." 
#	dir=${dir%/}/ #quita el / del final si existe. Se anade / al final
#	ls -d $dir*(/)
	ls -d ${${1:-.}%/}/*(/)
}
