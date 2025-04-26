#!/usr/bin/env bash

if pgrep swayidle >/dev/null; then
  pkill swayidle
  notify-send -a System "Swayidle" "Disabled" -t 1500 -h string:x-canonical-private-synchronous:volume
else
  notify-send -a System "Swayidle" "Enabled" -t 1500 -h string:x-canonical-private-synchronous:volume
  swayidle -w \
    timeout 1600 "swaylock -f" \
    timeout 1800 "wlopm --off '*'" resume "wlopm --on '*'" &
fi
