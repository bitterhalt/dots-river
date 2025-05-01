#!/usr/bin/env bash
set -euo pipefail

if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -qi 'MUTED'; then
  echo "mic: off"
else
  echo "mic: on"
fi
