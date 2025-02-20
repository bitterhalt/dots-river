#!/usr/bin/env bash

set -e

# Confirmation
confirm_action() {
  while true; do
    read -p "$1 (y/n): " choice
    case "$choice" in
    y | Y) return 0 ;;
    n | N)
      echo "Action canceled"
      return 1
      ;;
    *) echo "Invalid input. Please enter 'y' or 'n'." ;;
    esac
  done
}

# Update flatpak packages
echo "void-update: updating flatpak packages"
if confirm_action "Do you want to update flatpak packages"; then
  flatpak update
fi

# Update xbps packages
echo "void-update: updating xbps packages"
if confirm_action "Do you want to update xbps packages"; then
  sudo xbps-install -Su
fi
# Update pipx packages
echo "void-update: updating pipx packages"
if confirm_action "Do you want to update pipx packages"; then
  pipx upgrade-all
fi
