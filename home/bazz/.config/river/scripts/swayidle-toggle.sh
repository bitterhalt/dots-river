#!/usr/bin/env bash

if pgrep swayidle >/dev/null; then
  pkill swayidle
  notify-send -i my-caffeine-on-symbolic -a System "Swayidle" "Disabled" -t 1500 -h string:x-canonical-private-synchronous:volume
else
  notify-send -i my-caffeine-off-symbolic -a System "Swayidle" "Enabled" -t 1500 -h string:x-canonical-private-synchronous:volume
  swayidle -w &
fi
