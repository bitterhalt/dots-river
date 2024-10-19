#!/usr/bin/env bash

if pgrep -x "swayidle" >/dev/null; then
  echo ""
else
  echo "󰅶"
fi
