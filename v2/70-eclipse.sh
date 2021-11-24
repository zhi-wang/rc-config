if __linux; then
    # java 8u151
    export JAVA_HOME=/usr/local/java/jdk1.8.0_151
    __insert_paths PATH "$JAVA_HOME/bin"
    if [ -d "$HOME/local/eclipse" ]; then
        alias ec='"$HOME/local/eclipse/eclipse" --vm $(which java) &'
    fi
fi
