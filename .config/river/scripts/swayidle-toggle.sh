#!/usr/bin/env bash

if pgrep swayidle >/dev/null; then
  pkill swayidle
  notify-send -a center_notify "Swayidle" "Disabled" -t 1500 -h string:x-canonical-private-synchronous:volume
else
  notify-send -a center_notify "Swayidle" "Enabled" -t 1500 -h string:x-canonical-private-synchronous:volume
  swayidle -w \
    timeout 1800 "swaylock" \
    timeout 3600 "wlopm --off '*'" resume "wlopm --on '*'" \
    before-sleep "swaylock" &
fi
