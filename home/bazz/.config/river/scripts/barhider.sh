#!/usr/bin/env bash

if pgrep -x waybar >/dev/null; then
  killall -q waybar
  notify-send -t 2000 -a System -i ~/.local/share/icons/feather/x.svg "Bar disabled" -h string:x-canonical-private-synchronous:volume
else
  waybar &
fi
