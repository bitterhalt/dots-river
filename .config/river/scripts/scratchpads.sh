#!/usr/bin/env bash
# Riverctl script to open scratchpads, and open programs if Scratchpads are
# empty. Usage "./scratchpads.sh <term|lf|nvim|keepassxc|discord>"
# Check if an argument is provided

if [ -z "$1" ]; then
  echo "Error: No argument provided."
  exit 1
fi
term="foot"
yazi="$term --app-id special-yazi -e yazi"
nvim="$term --app-id special-nvim -e nvim"

editor_tag=$((1 << 11))
secrets_tag=$((1 << 12))
chat_tag=$((1 << 13))
tfm_tag=$((1 << 15))
case "$1" in
"yazi")
  search="special-yazi"
  tag="$tfm_tag"
  cmd="$yazi"
  ;;
"nvim")
  search="special-nvim"
  tag="$editor_tag"
  cmd="$nvim"
  ;;
"keepassxc")
  search="keepassxc"
  tag="$secrets_tag"
  cmd="keepassxc"
  ;;
"discord")
  search="discord"
  tag="$chat_tag"
  cmd="Vesktop"
  ;;
esac

if lswt | grep -q "$search"; then
  riverctl set-focused-tags "$tag"
else
  riverctl spawn "$cmd"
  riverctl set-focused-tags "$tag"
fi
