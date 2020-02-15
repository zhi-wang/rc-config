. $(dirname "${BASH_SOURCE[0]}")/bash-funcs.sh


# cuda
if linux__; then
  insert_dir_to_front__ /usr/local/cuda/bin PATH
  insert_dir_to_front__ /usr/local/cuda/lib64 LD_LIBRARY_PATH
fi
# pgi
if linux__; then
  append_dir_to_back__ /opt/pgi/linux86-64-llvm/2019/bin PATH
  append_dir_to_back__ /opt/pgi/linux86-64-llvm/2019/lib LD_LIBRARY_PATH
fi
