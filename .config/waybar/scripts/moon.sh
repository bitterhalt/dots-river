#!/usr/bin/env bash

# Shows the current moon phase.

moonfile="${XDG_DATA_HOME:-$HOME/.local/share}/moonphase"

[ -s "$moonfile" ] && [ "$(stat -c %y "$moonfile" 2>/dev/null | cut -d' ' -f1)" = "$(date '+%Y-%m-%d')" ] ||
  { curl -sf "wttr.in/?format=%m" >"$moonfile" || exit 1; }

icon="$(cat "$moonfile")"

case "$icon" in
🌑) name="New" ;;
🌒) name="Waxing Crescent" ;;
🌓) name="First Quarter" ;;
🌔) name="Waxing Gibbous" ;;
🌕) name="Full" ;;
🌖) name="Waning Gibbous" ;;
🌗) name="Last Quarter" ;;
🌘) name="Waning Crescent" ;;
*) exit 1 ;;
esac

# Output in JSON format for Waybar
echo "{\"text\": \"$icon\", \"tooltip\": \"Moonphase: $name\"}"
