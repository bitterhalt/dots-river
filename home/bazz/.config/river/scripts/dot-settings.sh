#!/usr/bin/env bash

# Menu options
ARCHIVE="RIVER
FOOT
FUZZEL
WAYBAR
ZSH
NEOVIM
"
CHOICE=$(printf "$ARCHIVE" | fuzzel -d -l 6 -p "Edit settings: ")

TERMCMD=("foot")

case $CHOICE in
FUZZEL) $TERMCMD -e nvim $HOME/.config/fuzzel/fuzzel.ini ;;
FOOT) $TERMCMD -e nvim $HOME/.config/foot/foot.ini ;;
NEOVIM) $TERMCMD -e nvim $HOME/.config/nvim/init.lua ;;
WAYBAR) $TERMCMD -e nvim $HOME/.config/waybar/config.jsonc ;;
RIVER) $TERMCMD -e nvim $HOME/.config/river/init ;;
ZSH) $TERMCMD -e nvim $HOME/.config/zsh/.zshrc ;;
esac
