if __linux; then
    __OMM_HOME=/usr/local/openmm
    __append_paths OPENMM_PLUGIN_DIR "$__OMM_HOME/lib/plugins"
    __append_paths LD_LIBRARY_PATH   "$__OMM_HOME/lib"
fi
