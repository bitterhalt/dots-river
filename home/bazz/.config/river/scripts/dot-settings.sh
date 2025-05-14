#!/usr/bin/env bash

# Menu options
ARCHIVE="RIVER
FOOT
FNOTT
FUZZEL
WAYBAR
BASH
NEOVIM
"
CHOICE=$(printf "$ARCHIVE" | fuzzel -d -a top --y 5 -w 30 -l 7 -p "Edit settings: ")

TERMCMD=("foot")

case $CHOICE in
BASH) $TERMCMD -e nvim $HOME/.bashrc ;;
FNOTT) $TERMCMD -e nvim $HOME/.config/fnott/fnott.ini ;;
FOOT) $TERMCMD -e nvim $HOME/.config/foot/foot.ini ;;
FUZZEL) $TERMCMD -e nvim $HOME/.config/fuzzel/fuzzel.ini ;;
NEOVIM) $TERMCMD -e nvim $HOME/.config/nvim/init.lua ;;
RIVER) $TERMCMD -e nvim $HOME/.config/river/init ;;
WAYBAR) $TERMCMD -e nvim $HOME/.config/waybar/config.jsonc ;;
esac
