#!/usr/bin/env bash
for i in {1..5}; do
  text=$(curl -s "https://wttr.in?format=+%c+%t+%m")
  if [[ $? == 0 ]]; then
    text=$(echo "$text" | sed -E "s/\s+/ /g")
    tooltip=$(curl -s "https://wttr.in?format=+%l:+%C,+%t+(%f)")
    if [[ $? == 0 ]]; then
      tooltip=$(echo "$tooltip" | sed -E "s/\s+/ /g")
      echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\"}"
      exit
    fi
  fi
  sleep 2
done
echo "{\"text\":\"error\", \"tooltip\":\"error\"}"
