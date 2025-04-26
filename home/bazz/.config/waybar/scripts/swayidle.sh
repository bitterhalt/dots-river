#!/usr/bin/env bash

if pgrep -x "swayidle" >/dev/null; then
  echo ""
else
  echo "{\"text\": \"󰒳\", \"tooltip\": \"<b>Swayidle is disabled</b>\n click left or press  + F11 to enable\"}"
fi
