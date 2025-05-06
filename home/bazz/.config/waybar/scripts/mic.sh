#!/usr/bin/env bash
set -euo pipefail

if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -qi 'MUTED'; then
  echo ""
else
  echo "{\"text\": \"󰍬\", \"tooltip\": \"<b>Microphone is active</b>\n click left or press  + F10 to disable\"}"
fi
