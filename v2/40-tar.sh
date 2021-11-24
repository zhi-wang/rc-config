__tar_cx() {
    local cx_ext=cx-save__
    local opt=$1 # c/x
    local file=$2
    shift

    case "$file" in
        *.tar)
            if [ $opt = c ]; then
                shift && COPYFILE_DISABLE=true tar -cf $file $*
            elif [ $opt = x ]; then
                tar -xvf $file
            fi
            ;;

        *.tar.bz | *.tar.bz2 | *.tbz | *.tbz2)
            if [ $opt = c ]; then
                shift && tar -cjf $file $*
            elif [ $opt = x ]; then
                tar -xvjf $file
            fi
            ;;

        *.bz | *.bz2)
            if [ $opt = c ]; then
                shift && bzip2 -k $*
                mv $*.bz2 $*.$cx_ext && mv $*.$cx_ext $file
            elif [ $opt = x ]; then
                bunzip2 $file
            fi
            ;;

        *.tar.gz | *.tgz)
            if [ $opt = c ]; then
                shift && tar -czf $file $*
            elif [ $opt = x ]; then
                tar -xvzf $file
            fi
            ;;

        *.gz)
            if [ $opt = c ]; then
                shift && gzip -k $*
                mv $*.gz $*.$cx_ext && mv $*.$cx_ext $file
            elif [ $opt = x ]; then
                gunzip $file
            fi
            ;;

        *.xip)
            if [ $opt = x ]; then
                xip -x $file
            fi
            ;;

        *.tar.xz | *.txz)
            if [ $opt = c ]; then
                shift && tar -cJf $file $*
            elif [ $opt = x ]; then
                tar -xvJf $file
            fi
            ;;

        *.xz)
            if [ $opt = c ]; then
                shift && xz -k $*
                mv $*.xz $*.$cx_ext && mv $*.$cx_ext $file
            elif [ $opt = x ]; then
                unxz $file
            fi
            ;;

        *.Z)
            if [ $opt = c ]; then
                shift && compress -c $* > $file
            elif [ $opt = x ]; then
                uncompress $file
            fi
            ;;

        *.zip)
            if [ $opt = c ]; then
                shift && zip -r $file $*
            elif [ $opt = x ]; then
                unzip $file
            fi
            ;;

        *)
            echo "Error: unsupported file type -- \"$file\"." ;;
    esac
}

dotar() {
    __tar_cx c $*
}

untar() {
    __tar_cx x $*
}

viewtar() {
    tar -tf $*;
}
