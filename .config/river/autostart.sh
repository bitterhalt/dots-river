#!/usr/bin/env bash

dbus-update-activation-environment DISPLAY WAYLAND_DISPLAY

executes="kanshi swayidle foot mako pipewire wl-paste swaybg /usr/libexec/polkit-gnome-authentication-agent-1"

for execute in $executes; do
  pidof -q "$execute" && continue
  case $execute in
  "foot") "$execute" -s & ;;
  "wl-paste")
    "$execute" --watch cliphist -max-items 100 store &
    ;;
  "swaybg")
    "$execute" -m fill -i ~/.local/share/wall/bg &
    ;;
  "swayidle")
    "$execute" -w \
      timeout 1800 "swaylock -f" \
      timeout 3600 "wlopm --off '*'" resume "wlopm --on '*'" \
      before-sleep "swaylock -f" &
    ;;
  *)
    "$execute" &
    ;;
  esac
done >/dev/null 2>&1

pkill -x waybar
waybar &

riverctl default-attach-mode bottom
riverctl default-layout rivertile
if ! pgrep -x "rivertile" >/dev/null; then
  rivertile -view-padding 5 -outer-padding 0 &
fi
