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
source "$(__this_dir)"/v2/20-os.sh
source "$(__this_dir)"/v2/20-stty.sh
source "$(__this_dir)"/v2/20-zsh.sh


### function ###
source "$(__this_dir)"/v2/40-catman.sh
source "$(__this_dir)"/v2/40-git.sh
source "$(__this_dir)"/v2/40-open.sh
source "$(__this_dir)"/v2/40-path.sh
source "$(__this_dir)"/v2/40-tar.sh
source "$(__this_dir)"/v2/40-te.sh


### alias ###
source "$(__this_dir)"/v2/60-alias.sh


### PATH ###
source "$(__this_dir)"/v2/70-bat.sh
source "$(__this_dir)"/v2/70-cmake.sh
source "$(__this_dir)"/v2/70-cuda.sh
source "$(__this_dir)"/v2/70-doxygen.sh
source "$(__this_dir)"/v2/70-eclipse.sh
source "$(__this_dir)"/v2/70-homebrew.sh
source "$(__this_dir)"/v2/70-intel.sh
source "$(__this_dir)"/v2/70-jupyter.sh
source "$(__this_dir)"/v2/70-llvm.sh
source "$(__this_dir)"/v2/70-local.sh
source "$(__this_dir)"/v2/70-openmm.sh
source "$(__this_dir)"/v2/70-pgi.sh
source "$(__this_dir)"/v2/70-python.sh
source "$(__this_dir)"/v2/70-texlive.sh
source "$(__this_dir)"/v2/70-tinker.sh
source "$(__this_dir)"/v2/70-vscode.sh
