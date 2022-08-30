  if which bat >/dev/null; then
    alias bat='bat -P'
elif which batcat >/dev/null; then
    alias bat=batcat
elif which pygmentize >/dev/null; then
    alias bat='pygmentize -g'
fi
