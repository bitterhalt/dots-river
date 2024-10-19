#!/usr/bin/env bash

# If you use non flatpak version you most likely have to edit line 5 and scratchpads.sh in River directory

#if pgrep -x "com.discordapp." >/dev/null; then
if pgrep -x "vesktop.bin" >/dev/null; then
  echo "󰭹 "
else
  echo ""
fi
