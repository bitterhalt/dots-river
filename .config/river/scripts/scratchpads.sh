#!/usr/bin/env bash
# Riverctl script to open scratchpads, and open programs if Scratchpads are
# empty. Usage "./scratchpads.sh <term|yazi|nvim|discord>"
# Check if an argument is provided

if [ -z "$1" ]; then
  echo "Error: No argument provided."
  exit 1
fi

term="foot"
yazi="$term --app-id special-yazi -e yazi"
zerminal="$term --app-id zen-term"

zen_tag=$((1 << 11))
chat_tag=$((1 << 12))
tfm_tag=$((1 << 13))
case "$1" in
"yazi")
  search="special-yazi"
  tag="$tfm_tag"
  cmd="$yazi"
  ;;
"term")
  search="zen-term"
  tag="$zen_tag"
  cmd="$zerminal"
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
