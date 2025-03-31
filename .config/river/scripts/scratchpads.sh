#!/usr/bin/env bash
# Riverctl script to open scratchpads, and open programs if Scratchpads are
# empty. Usage "./scratchpads.sh <term|yazi|nvim|discord>"
# Check if an argument is provided

if [ -z "$1" ]; then
  echo "Error: No argument provided."
  exit 1
fi

term="foot"
zerminal="$term --app-id zen-term"

zen_tag=$((1 << 11))
chat_tag=$((1 << 12))
case "$1" in
"term")
  search="zen-term"
  tag="$zen_tag"
  cmd="$zerminal"
  ;;
"discord")
  search="discord"
  tag="$chat_tag"
  cmd="vesktop"
  ;;
esac

if lswt | grep -q "$search"; then
  riverctl set-focused-tags "$tag"
else
  riverctl spawn "$cmd"
  riverctl set-focused-tags "$tag"
fi
