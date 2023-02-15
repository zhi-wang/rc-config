if __wsl; then
    open() {
        local file=$1

        case "$file" in
            *.pdf)
                wslview $file
                ;;

            *)
                echo "Error: unsupported file type -- \"$file\"." ;;
        esac
    }
fi
