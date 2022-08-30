  if which batcat >/dev/null; then
    alias ccat=batcat
elif which pygmentize >/dev/null; then
    alias ccat='pygmentize -g'
fi
