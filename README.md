# My dot-files
Configuration files and install scripts for my commonly used tools.

# Prerequisite
Make sure `GNU make` is ready.

# Usage
## Get help
`make help` - show this help

## Install and uninstall all modules
`make install` - install all dotfiles  
`make uninstall` - uninstall all dotfiles

## Install some modules
`make install [module]` - install a module (e.g. make install zsh tmux)  
`make [module]` - equivalent to `make install [module]` (e.g. make zsh tmux)

The `zsh` module also installs `~/.proxy.sh` and configures the `proxy` alias.

## Uninstall some modules
```sh
cd path/to/moduleconf
make uninstall
```
