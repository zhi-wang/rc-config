. $(dirname "${BASH_SOURCE[0]}")/bash-funcs.sh


# local/arsenal
__append_dir_to_back $HOME/local/arsenal PATH


# texlive 2019
__insert_dir_to_front /usr/local/texlive/2019/texmf-dist/doc/man MANPATH
__insert_dir_to_front /usr/local/texlive/2019/texmf-dist/doc/info INFOPATH
__insert_dir_to_front /usr/local/texlive/2019/texmf-dist/doc/info PATH


# cuda
if __linux; then
  __insert_dir_to_front /usr/local/cuda/bin PATH
  __insert_dir_to_front /usr/local/cuda/lib64 LD_LIBRARY_PATH
fi
# pgi
if __linux; then
  __append_dir_to_back /opt/pgi/linux86-64-llvm/2019/bin PATH
  __append_dir_to_back /opt/pgi/linux86-64-llvm/2019/lib LD_LIBRARY_PATH
fi
# openmm
if __linux; then
  __insert_dir_to_front /usr/local/openmm/lib/plugins OPENMM_PLUGIN_DIR
  __insert_dir_to_front /usr/local/openmm/lib LD_LIBRARY_PATH
fi
