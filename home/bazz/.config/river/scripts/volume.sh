#!/usr/bin/env bash

set -euo pipefail

case "${1:-}" in
up)
  wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
  wpctl set-volume -l 1.1 @DEFAULT_AUDIO_SINK@ 5%+
  pw-play "${HOME}/.local/share/Sounds/audio-volume-change.oga" &
  ;;
down)
  wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
  wpctl set-volume -l 1.1 @DEFAULT_AUDIO_SINK@ 5%-
  pw-play "${HOME}/.local/share/Sounds/audio-volume-change.oga" &
  ;;
mute)
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  ;;
*)
  echo "Usage: $0 {up|down|mute}"
  exit 1
  ;;
esac
