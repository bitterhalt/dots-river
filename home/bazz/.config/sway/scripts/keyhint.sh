#!/usr/bin/env bash

cat ~/.config/sway/config | grep 'bindsym' | grep -v '^\s*#' | sed 's/bindsym / /' | fuzzel -d -a top --y 5 -w 50 -l 15 -p "Search keyboard shortcuts:"
