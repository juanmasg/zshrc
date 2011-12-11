luacheck(){
    test -z "$1" && return
    for file in $*; do
        luac -o /dev/null $file && echo "$file: OK"
    done
}
