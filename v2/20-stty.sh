# detect interactive shell
__interact() {
    case "$-" in
        *i*)
            return 0
            ;;

        *)
            return 1
            ;;
    esac
}

if __linux; then
    if __interact; then
        stty intr ^x
        stty lnext undef
    fi
fi
