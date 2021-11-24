if __zsh; then
    # PS1
    PS1='%n@%m:%5~%(#.#. $) '
    PROMPT='%F{green}%n@%m%f:%5~%(#.#. $) '

    # autocomplete
    autoload -Uz compinit && compinit
fi
