#!/usr/bin/env bash

wl-copy -t image/png <"$1"
notify-send \
  -i "$(realpath $1)" \
  "${1%.*}" \
  "Copied to clipboard"
