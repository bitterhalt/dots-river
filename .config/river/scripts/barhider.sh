#!/usr/bin/env bash

if pgrep i3bar-river >/dev/null; then
  pkill i3bar-river
  notify-send -a center_notify "Bar" "Disabled" -t 1500 -h string:x-canonical-private-synchronous:volume
else
  i3bar-river &
fi
