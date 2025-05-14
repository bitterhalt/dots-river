#!/usr/bin/env bash

# Menu options
ARCHIVE="RIVER
FOOT
BEMENU
WAYBAR
ZSH
NEOVIM
"
CHOICE=$(printf "$ARCHIVE" | fuzzel -d -l 6 -p "Edit settings: ")

TERMCMD=("foot")

case $CHOICE in
BEMENU) $TERMCMD -e nvim $HOME/.local/bin/bemenu_runner ;;
FOOT) $TERMCMD -e nvim $HOME/.config/foot/foot.ini ;;
NEOVIM) $TERMCMD -e nvim $HOME/.config/nvim/init.lua ;;
WAYBAR) $TERMCMD -e nvim $HOME/.config/waybar/config.jsonc ;;
RIVER) $TERMCMD -e nvim $HOME/.config/river/init ;;
ZSH) $TERMCMD -e nvim $HOME/.config/zsh/.zshrc ;;
esac
