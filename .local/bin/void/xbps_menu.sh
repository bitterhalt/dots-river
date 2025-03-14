#!/usr/bin/env bash

set -euo pipefail

case $(printf "%s\n" "Update system" "Install packages" | bemenu_runner --fixed-height -W 0.20 -B1 -n -l3 -p Select:) in
"Update system")
  foot -a float-term -e popupgrade
  ;;
"Install packages")
  foot -a float-term -e fuzzypkg
  ;;
esac
