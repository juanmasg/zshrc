luacheck(){
   test -z "$1" && return
   luac -o /dev/null $1 && echo "$1: OK"
}
