#!/usr/bin/env bash

# Menu options
ARCHIVE="RIVER
FOOT
BEMENU
YAMBAR
ZSH
NEOVIM
MAKO"
CHOICE=$(printf "$ARCHIVE" | bemenu_runner -n -B1 -l9 -H0 -p "Edit settings:")

TERMCMD=("foot")

case $CHOICE in
BEMENU) $TERMCMD -e nvim $HOME/.local/bin/bemenu_runner ;;
FOOT) $TERMCMD -e nvim $HOME/.config/foot/foot.ini ;;
MAKO) $TERMCMD -e nvim $HOME/.config/mako/config ;;
NEOVIM) $TERMCMD -e nvim $HOME/.config/nvim/init.lua ;;
YAMBAR) $TERMCMD -e nvim $HOME/.config/yambar/config.yml ;;
RIVER) $TERMCMD -e nvim $HOME/.config/river/init ;;
ZSH) $TERMCMD -e nvim $HOME/.config/zsh/.zshrc ;;
esac
