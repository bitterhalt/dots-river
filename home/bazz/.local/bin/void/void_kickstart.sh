#!/bin/sh

# Stolen from: https://github.com/mwyvr/dotfiles/blob/main/private_dot_local/bin/executable_configure-void.sh
export ADDCMD="doas xbps-install -Sy"
export DOAS="doas"
export THEUSER="bazz"
export TIMEZONE="Europe/Helsinki"

$ADDCMD void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree xmirror
$DOAS xmirror
$ADDCMD

$DOAS usermod -aG wheel floppy audio video cdrom optical storage network input xbuilder $THEUSER
$DOAS unlink /var/service/wpa_supplicant
$ADDCMD dbus iwd polkit
$DOAS ln -sv /etc/sv/dbus /var/service/
$DOAS ln -sv /etc/sv/iwd /var/service/

$ADDCMD seatd
$DOAS ln -sv /etc/sv/seatd /var/service/
$DOAS usermod -aG _seatd $THEUSER

$ADDCMD socklog-void
$DOAS ln -sv /etc/sv/socklog-unix /var/service/
$DOAS ln -sv /etc/sv/nanoklogd /var/service/
$DOAS usermod -aG socklog $THEUSER

ln -svf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
$ADDCMD chrony
$DOAS ln -sv /etc/sv/chronyd /var/service/

$ADDCMD turnstile
mkdir -p ~/.config/service/dbus
$DOAS ln -sv /etc/sv/turnstiled /var/service/
ln -s /usr/share/examples/turnstile/dbus.run ~/.config/service/dbus/run

$ADDCMD xorg-minimal xorg-fonts mesa-dri vulkan-loader mesa-vulkan-radeon mesa-vaapi mesa-vdpau

$ADDCMD sway foot kanshi bemenu Waybar swaybg swayidle swaylock \
  libnotify fnott lf file-roller xdg-user-dirs-gtk xdg-user-dirs \
  brightnessctl xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr
xdg-user-dirs-update
xdg-user-dirs-update --force

$ADDCMD pipewire pulseaudio-utils alsa-pipewire
$DOAS mkdir -p /etc/pipewire/pipewire.conf.d
$DOAS ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
$DOAS ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/

$ADDCMD git curl gnupg rsync xtools neovim unrar 7zip htop firefox noto-fonts-cjk noto-fonts-ttf noto-fonts-emoji noto-fonts-ttf adwaita-icon-theme
