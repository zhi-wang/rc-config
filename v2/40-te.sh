te() {
    if __linux; then
        if type xed &> /dev/null; then
            xed "$@" &
        elif type gedit &> /dev/null; then
            gedit "$@" &
        fi
    elif __macos; then
        open -a TextEdit "$@"
    fi
}
