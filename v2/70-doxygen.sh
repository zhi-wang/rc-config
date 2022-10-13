if __linux; then
  if [ -d $HOME/local/doxygen/build ]; then
    DOXY_DIR=$HOME/local/doxygen/build
fi
fi

if [ ! -z "$DOXY_DIR" ]; then
    __insert_paths PATH "$DOXY_DIR/bin"
fi
