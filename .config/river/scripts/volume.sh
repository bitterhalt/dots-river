#!/usr/bin/env bash

set -euo pipefail

case "${1:-}" in
up)
  wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
  wpctl set-volume -l 1.1 @DEFAULT_AUDIO_SINK@ 5%+
  #  pw-play "$HOME/.local/share/Sounds/audio-volume-change.oga" &
  ;;
down)
  wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
  wpctl set-volume -l 1.1 @DEFAULT_AUDIO_SINK@ 5%-
  #  pw-play "$HOME/.local/share/Sounds/audio-volume-change.oga" &
  ;;
mute)
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  ;;
esac

vol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

# If muted, print "muted" and exit.
[ "$vol" != "${vol%\[MUTED\]}" ] && notify-send -a vol_notify "muted" -h string:x-canonical-private-synchronous:volume && exit

vol="${vol#Volume: }"

split() {
  # For ommiting the . without calling and external program.
  IFS=$2
  set -- $1
  printf '%s' "$@"
}

vol="$(printf "%.0f" "$(split "$vol" ".")")"

case 1 in
$((vol >= 1))) text="Vol:" ;;
*) notify-send -a vol_notify "muted" -h string:x-canonical-private-synchronous:volume && exit ;;
esac

notify-send \
  -t 1000 \
  -a vol_notify \
  "$text $vol%" \
  -h string:x-canonical-private-synchronous:volume
