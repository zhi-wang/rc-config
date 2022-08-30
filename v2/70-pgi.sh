  if [ -d /opt/nvidia/hpc_sdk/Linux_x86_64/22.5 ]; then
    PGI=/opt/nvidia/hpc_sdk/Linux_x86_64/22.5/compilers
    PGIMPI=/opt/nvidia/hpc_sdk/Linux_x86_64/22.5/comm_libs/mpi
elif [ -d /opt/nvidia/hpc_sdk/Linux_x86_64/22.2 ]; then
    PGI=/opt/nvidia/hpc_sdk/Linux_x86_64/22.2/compilers
    PGIMPI=/opt/nvidia/hpc_sdk/Linux_x86_64/22.2/comm_libs/mpi
elif [ -d /opt/nvidia/hpc_sdk/Linux_x86_64/21.7 ]; then
    PGI=/opt/nvidia/hpc_sdk/Linux_x86_64/21.7/compilers
    PGIMPI=/opt/nvidia/hpc_sdk/Linux_x86_64/21.7/comm_libs/mpi
elif [ -d /opt/nvidia/hpc_sdk/Linux_x86_64/21.1 ]; then
    PGI=/opt/nvidia/hpc_sdk/Linux_x86_64/21.1/compilers
    PGIMPI=/opt/nvidia/hpc_sdk/Linux_x86_64/21.1/comm_libs/mpi
elif [ -d /opt/nvidia/hpc_sdk/Linux_x86_64/20.11 ]; then
    PGI=/opt/nvidia/hpc_sdk/Linux_x86_64/20.11/compilers
    PGIMPI=/opt/nvidia/hpc_sdk/Linux_x86_64/20.11/comm_libs/mpi
elif [ -d /opt/nvidia/hpc_sdk/Linux_x86_64/20.9 ]; then
    PGI=/opt/nvidia/hpc_sdk/Linux_x86_64/20.9/compilers
    PGIMPI=/opt/nvidia/hpc_sdk/Linux_x86_64/20.9/comm_libs/mpi
elif [ -d /opt/pgi/linux86-64-llvm/19.10 ]; then
    PGI=/opt/pgi/linux86-64-llvm/19.10
    PGIMPI=/opt/pgi/linux86-64-llvm/2019/mpi/openmpi-3.1.3
fi

if __linux; then
    __append_paths PATH            "$PGI/bin"
    __append_paths LD_LIBRARY_PATH "$PGI/lib"
    __append_paths MANPATH         "$PGI/man"
    __insert_paths PATH            "$PGIMPI/bin"
    __insert_paths LD_LIBRARY_PATH "$PGIMPI/lib"
    __insert_paths MANPATH         "$PGIMPI/share/man"
fi
