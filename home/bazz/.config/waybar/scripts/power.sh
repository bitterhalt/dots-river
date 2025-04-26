#!/bin/bash

ACTION=$1 # The action to perform (e.g., shutdown, reboot)
MSG="Are you sure you want to $ACTION?"

# Display a confirmation dialog
if yad --title="Confirm Action" --text="$MSG" --button=Yes:0 --button=No:1; then
  if [ "$ACTION" = "shutdown" ]; then
    loginctl poweroff
  elif [ "$action" = "reboot" ]; then
    loginctl reboot
  elif [ "$ACTION" = "suspend" ]; then
    loginctl suspend
  fi
fi
