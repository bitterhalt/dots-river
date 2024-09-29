#!/usr/bin/env bash

vol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

# Check if muted
if [[ "$vol" == *"[MUTED]"* ]]; then
  echo '{"text": "󰝟", "tooltip": "Muted"}'
  exit
fi

vol="${vol#Volume: }"

split() {
  IFS=$2
  set -- $1
  printf '%s' "$@"
}

vol="$(printf "%.0f" "$(split "$vol" ".")")"

case 1 in
$((vol >= 50))) icon="󰕾" ;;
$((vol >= 30))) icon="󰖀" ;;
$((vol >= 1))) icon="󰕿" ;;
*) icon="󰝟" ;;
esac

echo "{\"text\": \"$icon\", \"tooltip\": \"Volume: $vol%\"}"
