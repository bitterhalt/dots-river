#!/usr/bin/env bash

# Launch river-tag-overlay when yambar is killed
if pgrep -x yambar >/dev/null; then
  killall -q yambar
  notify-send -a System "Bar disabled" -t 1500 -h string:x-canonical-private-synchronous:volume
  # Launch river-tag-overlay when yambar is killed
  ~/.config/river/scripts/river-tag-overlay.sh &
else
  if pgrep -f river-tag-overlay >/dev/null; then
    killall -q river-tag-overlay
  fi
  # Launch yambar when river-tag-overlay is killed
  yambar &
fi
