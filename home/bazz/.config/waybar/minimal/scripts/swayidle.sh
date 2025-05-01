#!/usr/bin/env bash

if pgrep -x "swayidle" >/dev/null; then

  echo "{\"text\": \"on\", \"tooltip\": \"<b>Swayidle is disabled</b>\n click left or press  + F11 to enable\"}"

else
  echo "{\"text\": \"off\", \"tooltip\": \"<b>Swayidle is disabled</b>\n click left or press  + F11 to enable\"}"
fi
