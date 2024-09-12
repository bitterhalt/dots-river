#!/usr/bin/env bash

# If you use non flatpak version you most likely have to edit line 5 and scratchpads.sh in River directory

if pgrep -x "com.discordapp." >/dev/null; then
  echo "{\"text\": \"\", \"tooltip\": \"<b>Discord is running in hidden workspace</b>\n left or  + F6 to open workspace\n middle to close Discord\"}"
else
  echo ""
fi
