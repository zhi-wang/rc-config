if [ -h "${BASH_SOURCE[0]}" ]; then
  # if it is a symlink
  . $(dirname $(readlink -f "${BASH_SOURCE[0]}"))/bash-funcs.sh
else
  . $(dirname "${BASH_SOURCE[0]}")/bash-funcs.sh
fi


# alias
alias clear='printf "\033c"'
alias lo=exit
alias url-github="firefox https://github.com/zhi-wang/tinker.gpu"


# local/arsenal
__append_dir_back "$HOME"/local/arsenal PATH


# texlive 2019
TEXLIVE=/usr/local/texlive/2019
__insert_dir_front "$TEXLIVE"/texmf-dist/doc/man  MANPATH
__insert_dir_front "$TEXLIVE"/texmf-dist/doc/info INFOPATH
__insert_dir_front "$TEXLIVE"/bin/x86_64-linux    PATH


# java 8u151
if __linux; then
  export JAVA_HOME=/usr/local/java/jdk1.8.0_151
  __insert_dir_front "$JAVA_HOME"/bin PATH
fi


# cuda
if __linux; then
  CUDA=/usr/local/cuda
  __insert_dir_front "$CUDA"/bin   PATH
  __insert_dir_front "$CUDA"/lib64 LD_LIBRARY_PATH
fi
# pgi
if __linux; then
  PGI=/opt/pgi/linux86-64-llvm/19.10
  __append_dir_back "$PGI"/bin PATH
  __append_dir_back "$PGI"/lib LD_LIBRARY_PATH
  __append_dir_back "$PGI"/man MANPATH
fi
# openmm
if __linux; then
  __OMM_HOME=/usr/local/openmm
  __insert_dir_front "$__OMM_HOME"/lib/plugins OPENMM_PLUGIN_DIR
  __insert_dir_front "$__OMM_HOME"/lib         LD_LIBRARY_PATH
fi
