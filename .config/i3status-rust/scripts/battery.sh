#!/usr/bin/env bash

BATTERY_FILE=/tmp/battery-statusbar

for battery in /sys/class/power_supply/BAT*?; do
  capacity=$(cat $battery/capacity)

  # Horizontal Icons
  #         

  icons="󰂎󰁺󰁻󰁼󰁽󰁾󰁿󰂀󰂁󰂂󰁹"
  icon=${icons:$((capacity / 10)):1}

  result="$capacity%% $icon "

  status=$(cat $battery/status)

  case $status in
    "Charging")
      result+=""
      [ -f $BATTERY_FILE ] && rm $BATTERY_FILE
    ;;
    *)
      result=${result::-1}
      [ ! -f $BATTERY_FILE ] && [ $capacity -lt 11 ] && touch $BATTERY_FILE && notify-send -u critical "Battery low" "Battery is at $capacity%"
    ;;
  esac

  printf "$result"
done
