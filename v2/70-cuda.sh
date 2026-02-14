if __linux; then
    __CUDA_diR=/usr/local/cuda
    __insert_paths PATH            "$__CUDA_diR/bin"
    __insert_paths LD_LIBRARY_PATH "$__CUDA_diR/lib64"
fi
