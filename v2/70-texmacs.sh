  if [ -d $HOME/local/texmacs/2.1.1 ]; then
    export TEXMACS_PATH=$HOME/local/texmacs/2.1.1
fi

if [ ! -z "$TEXMACS_PATH" ]; then
    __insert_paths PATH "$TEXMACS_PATH/bin"
fi
