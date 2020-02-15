#   .bash_profile is the bash version of .profile
#     read by login shells
#     one-time setup, e.g. load environment variables once per session
#   .bashrc
#       per-shell stuff put in .bashrc


# Linux
#   .bash_profile will NOT be executed if you have already logged in and you
#     open a new terminal window; .bashrc will be used


# macOS Terminal.app
#   always creates new login shells by default calling .bash_profile
#   other GUI terminal emulators may do the same, but most tend not to


# Bash: test interactive shell
#   [[ $- == *i* ]] && echo 'interactive shell' || echo 'non-interactive shell'
# Bash: test login shell
#   shopt -q login_shell && echo 'login shell' || echo 'non-login shell'


# Non login shell
#   Started by a program without login


# Login shell
#   Started after a successful login


# Interactive shell


# Non-interactive shell
#    Often run from a script or similar
