if __linux; then
    CUDA=/usr/local/cuda
    __insert_paths PATH            "$CUDA/bin"
    __insert_paths LD_LIBRARY_PATH "$CUDA/lib64"
fi
