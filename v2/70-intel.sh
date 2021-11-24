if __linux; then
    if [ -d /opt/intel/parallel_studio_xe_2019/bin ]; then
        source /opt/intel/parallel_studio_xe_2019/bin/psxevars.sh &> /dev/null
    fi
    if [ -d /opt/intel/mkl ]; then
        export MKLROOT=/opt/intel/mkl
        __append_paths LD_LIBRARY_PATH "$MKLROOT/lib/intel64"
    fi
fi
