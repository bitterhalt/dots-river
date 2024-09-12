#!/usr/bin/env bash

# Menu options
ARCHIVE="RIVER
FOOT
BEMENU
LF
WAYBAR
SWAYLOCK
ZSH
NEOVIM
GTK-SETTINGS
MAKO"
CHOICE=$(printf "$ARCHIVE" | bemenu_runner -n -B1 -l9 -H0 -p "Edit settings:")

# Launch nvim on with foot as floating window
TERMCMD=("foot")

case $CHOICE in
BEMENU) $TERMCMD -e nvim $HOME/.local/bin/bemenu_runner ;;
FOOT) $TERMCMD -e nvim $HOME/.config/foot/foot.ini ;;
GTK-SETTINGS) nwg-look ;;
LF) $TERMCMD -e nvim $HOME/.config/lf/lfrc ;;
MAKO) $TERMCMD -e nvim $HOME/.config/mako/config ;;
NEOVIM) $TERMCMD -e nvim $HOME/.config/nvim/init.lua ;;
RIVER) $TERMCMD -e nvim $HOME/.config/river/init ;;
SWAYLOCK) $TERMCMD -e nvim $HOME/.config/swaylock/config ;;
WAYBAR) $TERMCMD -e nvim $HOME/.config/waybar/config.jsonc ;;
ZSH) $TERMCMD -e nvim $HOME/.config/zsh/.zshrc ;;
esac
