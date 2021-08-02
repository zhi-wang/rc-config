function __bash() {
  if [ $SHELL = /bin/bash ] || [ $SHELL = /usr/bin/bash ]; then
    return 0
  else
    return 1
  fi
}
function __zsh() {
  if [ $SHELL = /bin/zsh ] || [ $SHELL = /usr/bin/zsh ]; then
    return 0
  else
    return 1
  fi
}
function __source0() {
  if __bash; then
    echo "${BASH_SOURCE[0]}"
  elif __zsh; then
    echo "${(%):-%x}"
  fi
}
if [ -h "$(__source0)" ]; then
  # if it is a symlink
  . $(dirname $(readlink -f "$(__source0)"))/bash-funcs.sh
else
  . $(dirname "$(__source0)")/bash-funcs.sh
fi


# alias
alias clear='printf "\033c"'
if __linux; then
  alias ls='ls -F --color=auto'
else
  alias ls='ls -FG'
fi
alias la='ls -a'
alias lh='ls -lh'
alias lla='ls -la'
alias lo=exit
alias lt='ls -lat'


# stty
if __linux; then
  if __interact; then
    stty intr ^X
    stty lnext undef
  fi
fi


# PS1
if __zsh; then
  PS1='%n@%m %5~%(#.#.$) '
fi


# local/arsenal
# local/bin
__insert_dir_front "$HOME/local/arsenal" PATH
__insert_dir_front "$HOME/local/bin"     PATH


# texlive 2019
TEXLIVE=/usr/local/texlive/2019
__insert_dir_front "$TEXLIVE/texmf-dist/doc/man"  MANPATH
__insert_dir_front "$TEXLIVE/texmf-dist/doc/info" INFOPATH
__insert_dir_front "$TEXLIVE/bin/x86_64-linux"    PATH


# tinker
if __linux; then
  __insert_dir_front "$HOME/tinker/bin/linux" PATH
elif __macos; then
  __insert_dir_front "$HOME/tinker/bin/macos" PATH
fi


# java 8u151
if __linux; then
  export JAVA_HOME=/usr/local/java/jdk1.8.0_151
  __insert_dir_front "$JAVA_HOME/bin" PATH
fi


# eclipse
if __linux; then
  if [ -d "$HOME/local/eclipse" ]; then
    alias ec='"$HOME/local/eclipse/eclipse" --vm $(which java) &'
  fi
fi


# intel
if __linux; then
  if [ -d /opt/intel/parallel_studio_xe_2019/bin ]; then
    source /opt/intel/parallel_studio_xe_2019/bin/psxevars.sh &> /dev/null
  fi
  if [ -d /opt/intel/mkl ]; then
    export MKLROOT=/opt/intel/mkl
    __append_dir_back "$MKLROOT/lib/intel64" LD_LIBRARY_PATH
  fi
fi


# cuda
if __linux; then
  CUDA=/usr/local/cuda
  __insert_dir_front "$CUDA/bin"   PATH
  __insert_dir_front "$CUDA/lib64" LD_LIBRARY_PATH
fi
# pgi
if [ -d /opt/pgi/linux86-64-llvm/19.10 ]; then
  PGI=/opt/pgi/linux86-64-llvm/19.10
  PGIMPI=/opt/pgi/linux86-64-llvm/2019/mpi/openmpi-3.1.3
fi
if [ -d /opt/nvidia/hpc_sdk/Linux_x86_64/20.9 ]; then
  PGI=/opt/nvidia/hpc_sdk/Linux_x86_64/20.9/compilers
  PGIMPI=/opt/nvidia/hpc_sdk/Linux_x86_64/20.9/comm_libs/mpi
fi
if [ -d /opt/nvidia/hpc_sdk/Linux_x86_64/20.11 ]; then
  PGI=/opt/nvidia/hpc_sdk/Linux_x86_64/20.11/compilers
  PGIMPI=/opt/nvidia/hpc_sdk/Linux_x86_64/20.11/comm_libs/mpi
fi
if [ -d /opt/nvidia/hpc_sdk/Linux_x86_64/21.7 ]; then
  PGI=/opt/nvidia/hpc_sdk/Linux_x86_64/21.7/compilers
  PGIMPI=/opt/nvidia/hpc_sdk/Linux_x86_64/21.7/comm_libs/mpi
fi
if __linux; then
  __append_dir_back "$PGI/bin" PATH
  __append_dir_back "$PGI/lib" LD_LIBRARY_PATH
  __append_dir_back "$PGI/man" MANPATH
  __append_dir_back "$PGIMPI/bin"       PATH
  __append_dir_back "$PGIMPI/lib"       LD_LIBRARY_PATH
  __append_dir_back "$PGIMPI/share/man" MANPATH
fi
# openmm
if __linux; then
  __OMM_HOME=/usr/local/openmm
  __insert_dir_front "$__OMM_HOME/lib/plugins" OPENMM_PLUGIN_DIR
  __insert_dir_front "$__OMM_HOME/lib"         LD_LIBRARY_PATH
fi
