#!/usr/bin/env bash

if pgrep -x "swayidle" >/dev/null; then
  echo ""
else
  echo "{\"text\": \"󰒳\", \"tooltip\": \"<b>Swayidle is disabled</b>\n left or   + Shift + F11 to enable\"}"
fi
