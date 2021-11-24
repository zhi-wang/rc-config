__system=$(uname -s)


__macos() {
    if [ $__system = Darwin ]; then
        return 0
    else
        return 1
    fi
}


__linux() {
    if [ $__system = Linux ]; then
        return 0
    else
        return 1
    fi
}
