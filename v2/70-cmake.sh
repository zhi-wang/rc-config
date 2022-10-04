if __linux; then
  if [ -d $HOME/local/cmake/cmake-3.18.6-Linux-x86_64 ]; then
    CMAKE_DIR=$HOME/local/cmake/cmake-3.18.6-Linux-x86_64
fi
fi

if [ ! -z "$CMAKE_DIR" ]; then
    __insert_paths PATH "$CMAKE_DIR/bin"
fi
