  if [ -d /usr/local/texlive/2022 ]; then
    TEXLIVE=/usr/local/texlive/2022
elif [ -d /usr/local/texlive/2021 ]; then
    TEXLIVE=/usr/local/texlive/2021
elif [ -d /usr/local/texlive/2020 ]; then
    TEXLIVE=/usr/local/texlive/2020
elif [ -d /usr/local/texlive/2019 ]; then
    TEXLIVE=/usr/local/texlive/2019
fi

if [ ! -z "$TEXLIVE" ]; then
    __insert_paths INFOPATH "$TEXLIVE/texmf-dist/doc/info"
    __insert_paths MANPATH  "$TEXLIVE/texmf-dist/doc/man"
if __linux; then
    __insert_paths PATH     "$TEXLIVE/bin/x86_64-linux"
elif __macos; then
    __insert_paths PATH     "$TEXLIVE/bin/universal-darwin"
fi
fi
