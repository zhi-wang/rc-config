### this direcotry ###
__bash() {
    if [ -n "$BASH_VERSION" ]; then
        return 0
    else
        return 1
    fi
}


__zsh() {
    if [ -n "$ZSH_VERSION" ]; then
        return 0
    else
        return 1
    fi
}


__source0() {
    if __bash; then
        echo "${BASH_SOURCE[0]}"
    elif __zsh; then
        echo "${(%):-%x}"
    fi
}


__this_dir() {
    file="$(__source0)"
    if [ -h "$file" ]; then
        file="$(ls -l "$(__source0)" | awk '{print $NF}')"
    fi
    dir="$(dirname $file)"
    echo "$(cd $dir; pwd)"
}


### system ###
. "$(__this_dir)"/20-os.sh
. "$(__this_dir)"/20-stty.sh
source "$(__this_dir)"/20-ps1.sh


### function ###
. "$(__this_dir)"/40-catman.sh
. "$(__this_dir)"/40-git.sh
. "$(__this_dir)"/40-path.sh
. "$(__this_dir)"/40-tar.sh
. "$(__this_dir)"/40-te.sh


### alias ###
. "$(__this_dir)"/60-alias.sh


### PATH ###
. "$(__this_dir)"/70-cuda.sh
. "$(__this_dir)"/70-homebrew.sh
. "$(__this_dir)"/70-llvm.sh
. "$(__this_dir)"/70-openmm.sh
. "$(__this_dir)"/70-python.sh
. "$(__this_dir)"/70-texlive.sh
. "$(__this_dir)"/70-vscode.sh
