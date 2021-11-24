# __contains string substring
# Does string contains substring? Yes: 0; No: 1.
__contains() {
    local string=$1
    local substring=$2
    if [ "${string#*$substring}" != "$string" ]; then
        return 0
    else
        return 1
    fi
}


# __add_dir_to_path front/back dir PATH
__add_dir_to_path() {
    local flag=$1 # front/back
    local dir=$2
    local pathname=$3
    local p=$(eval echo -e "\$$pathname")
        if ! __contains "$p" "$dir"; then
        if [ -d "$dir" ]; then
            if [ -z "$p" ]; then
                # if $p is empty
                export $pathname="$dir"
                return 0
            elif [ $flag = front ]; then
                export $pathname="$dir":"$p"
                return 0
            elif [ $flag = back ]; then
                export $pathname="$p":"$dir"
                return 0
            fi
        fi
    fi
    return 1
}


# __insert_paths PATH dir1 dir2 ...
# stop at the first successful insertion
__insert_paths() {
    for p in "${@:2}"; do
        if __add_dir_to_path front "$p" $1; then
            break
        fi
    done
}


# __append_paths PATH dir1 dir2 ...
# stop at the first successful appending
__append_paths()  {
    for p in "${@:2}"; do
        if __add_dir_to_path back "$p" $1; then
            break
        fi
    done
}
