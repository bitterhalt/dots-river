#!/usr/bin/env bash

set -euo pipefail

wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -qi 'MUTED'; then
  notify-send -a vol_notify "Mic" "off" -t 1500 -h string:x-canonical-private-synchronous:volume
else
  notify-send -a vol_notify "Mic" "on" -t 1500 -h string:x-canonical-private-synchronous:volume
fi
