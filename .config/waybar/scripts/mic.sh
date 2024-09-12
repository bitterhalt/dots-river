#!/usr/bin/env bash
set -euo pipefail

if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -qi 'MUTED'; then
  echo ""
else
  echo ""
fi
