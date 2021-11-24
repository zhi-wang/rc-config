alias clear='printf "\033c"'

if __linux; then
    alias ls='ls -F --color=auto'
elif __macos; then
    alias ls='ls -FG'
fi
alias la='ls -a'
alias lh='ls -lh'
alias lla='ls -la'
alias lt='ls -lat'

alias lo=exit
