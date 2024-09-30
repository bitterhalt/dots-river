#!/usr/bin/env bash

BEMENU_ARGS=(
  -i        # Filter items case-insensitively
  -H28      # Line-height
  -P '*'    # Prefix
  --cw '2'  # Width of the cursor
  --ch '18' # Height of the cursor
  --hp '8'  # Horizontal padding for the entries in single line mode
  --fn 'JetBrains Mono 16px'
  --tb '#161616' --tf '#be95ff'
  --fb '#161616' --ff '#ffffff'
  --cb '#161616' --cf '#525252'
  --nb '#161616' --nf '#e0e0e0'
  --ab '#161616' --af '#e0e0e0'
  --hb '#161616' --hf '#be95ff'
  --bdr '#262626' --cf '#323232'
  --single-instance
  "$@")

if [ "$1" = 'run' ]; then
  bemenu-run "${BEMENU_ARGS[@]}"
else
  bemenu "${BEMENU_ARGS[@]}"
fi
