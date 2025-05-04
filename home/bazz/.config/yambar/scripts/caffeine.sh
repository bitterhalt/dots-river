#!/bin/bash

# River swayidle toggle
function toggle {
  if pgrep swayidle >/dev/null; then
    pkill -x swayidle
    notify-send -a System "Swayidle" "Disabled" -t 1500 -h string:x-canonical-private-synchronous:volume
  else
    notify-send -a System "Swayidle" "Enabled" -t 1500 -h string:x-canonical-private-synchronous:volume
    swayidle -w &
  fi
}

case $1 in
toggle)
  toggle
  ;;
*)
  if pgrep -x "swayidle" >/dev/null; then
    icon="󰤄"
  else
    text="󱐋"
  fi
  echo "icon|string|$icon"
  echo ""
  ;;
esac

exit 0
