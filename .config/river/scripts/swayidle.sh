#!/usr/bin/env bash

swayidle -w \
  timeout 1800 "swaylock" \
  timeout 3600 "wlopm --off '*'" resume "wlopm --on '*'" \
  before-sleep "swaylock" &
