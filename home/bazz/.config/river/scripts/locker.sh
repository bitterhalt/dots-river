#!/usr/bin/env bash
# Times the screen off and puts it to background
swayidle \
  timeout 120 "wlopm --off '*'" \
  resume "wlopm --on '*'" &
# Locks the screen immediately
waylock -ignore-empty-password \
  -init-color 0x000000 \
  -input-color 0x0c0c0c \
  -fail-color 0xAF3029
# Kills last background task so idle timer doesn't keep running
kill %%
