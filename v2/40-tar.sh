__tar_cx() {
    # BSD tar
    export COPYFILE_DISABLE=true
    export COPYFILE_IDOFF=true
    # GNU tar
    local gnu_opts="--exclude='._*' --exclude='.DS_Store'"

    local opt=$1 # c/x
    local file=$2
    shift

    case "$file" in
        *.tar)
            if [ $opt = c ]; then
                shift && tar $gnu_opts -cf "$file" "$@"
            elif [ $opt = x ]; then
                tar -xvf "$file"
            fi
            ;;
        *.tar.bz | *.tar.bz2 | *.tbz | *.tbz2)
            if [ $opt = c ]; then
                shift && tar $gnu_opts -cjf "$file" "$@"
            elif [ $opt = x ]; then
                tar -xvjf "$file"
            fi
            ;;
        *.tar.gz | *.tgz)
            if [ $opt = c ]; then
                shift && tar $gnu_opts -czf "$file" "$@"
            elif [ $opt = x ]; then
                tar -xvzf "$file"
            fi
            ;;
        *.xip)
            if [ $opt = x ]; then
                xip -x "$file"
            fi
            ;;
        *.tar.xz | *.txz)
            if [ $opt = c ]; then
                shift && tar $gnu_opts -cJf "$file" "$@"
            elif [ $opt = x ]; then
                tar -xvJf "$file"
            fi
            ;;
        *.zip)
            if [ $opt = c ]; then
                shift && zip -r "$file" "$@"
            elif [ $opt = x ]; then
                unzip "$file"
            fi
            ;;
        *)
            echo "Error: unsupported file type -- \"$file\"."
            ;;
    esac
}

dotar() {
    __tar_cx c "$@"
}

untar() {
    __tar_cx x "$@"
}

viewtar() {
    tar -tf "$@"
}
