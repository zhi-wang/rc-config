## Linux

|           | interactive                                  | non-interactive              |
|-----------|----------------------------------------------|------------------------------|
| login     | remote ssh; login via tty: `Ctrl + Alt + F1` | `echo command \| ssh server` |
| non-login | new terminal                                 | run a script                 |


## macOS Terminal.app

New terminal always opens an interactive login shell.


## bash

- `.bash_profile`, `.bash_login`, `.profile`: login shells (interactive or non-interactive); only read and execute the first file that exists.
- `.bashrc`: non-login interactive shells.


## zsh

| file        | login | interactive | non-interactive | Terminal.app |
|-------------|-------|-------------|-----------------|--------------|
| `.zshenv`   | Y     | Y           | Y               | Y            |
| `.zprofile` | Y     | N           | N               | Y            |
| `.zsh`      | Y     | Y           | N               | Y            |
