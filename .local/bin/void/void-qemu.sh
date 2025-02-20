#!/usr/bin/env bash

# This script is for my personal use only. It suppose to be run as non root user.
# Debs: Voidlinux, dbus, polkit + their services

set -e

# Confirmation prompt
printf "\n>> WARNING: This script will install tons of packages and enable runit services!\nPlease stop right now, if you have no idea what you are about to do!\n Still wanna Proceed? (y/n): "
read -r confirm
if [[ "$confirm" != "y" ]]; then
  printf "\n>> Installation aborted.\n"
  exit 1
fi

# Install necessary packages
printf "\n>> Installing required packages <<\n"
sudo xbps-install -S libvirt virt-manager virt-manager-tools xz qemu bridge-utils

# Enable runit services
printf "\n>> Enabling libvirt services <<\n"
for service in libvirtd virtlockd virtlogd; do
  if [ -L /var/service/$service ]; then
    printf ">> Service $service already enabled.\n"
  else
    printf ">> Enabling $service service.\n"
    sudo ln -s /etc/sv/$service /var/service
  fi
done

# Add the current user to the necessary groups
printf "\n>> Adding current user to kvm and libvirt groups <<\n"
sudo usermod -aG kvm,libvirt $USER

# Success message
printf "\n>> QEMU setup complete! Please log out and back in for group changes to take effect. <<\n"
