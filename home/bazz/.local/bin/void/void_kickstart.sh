#!/bin/sh

# Stolen from: https://github.com/mwyvr/dotfiles/blob/main/private_dot_local/bin/executable_configure-void.sh

export ADDCMD="doas xbps-install -Sy"
export DOAS="doas"
export THEUSER="bazz"
export TIMEZONE="Europe/Helsinki"

if [ "$(id -u)" -eq 0 ]; then
  echo "Run as the regular user, not as root or sudo/doas"
  exit 1
fi

$ADDCMD -u

base_hardware() {

  if lscpu | grep "GenuineIntel"; then
    $ADDCMD void-repo-nonfree
    $ADDCMD -u
    $ADDCMD intel-ucode linux-firmware-intel
  fi
  if lscpu | grep "AuthenticAMD"; then
    $ADDCMD linux-firmware-amd
  fi

}

configuration() {

  $DOAS usermod -aG wheel floppy audio video cdrom optical storage network input xbuilder $THEUSER
  $ADDCMD dbus NetworkManager polkit
  $DOAS ln -sv /etc/sv/dbus /var/service/
  $DOAS ln -sv /etc/sv/NetworkManager /var/service/

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
  $DOAS ln -sv /etc/sv/turnstiled /var/service/
  mkdir -p ~/.config/service/dbus
  ln -s /usr/share/examples/turnstile/dbus.run ~/.config/service/dbus/run

  if [ -d "/proc/acpi/button/lid" ]; then
    $ADDCMD linux-firmware-intel mesa-dri vulkan-loader mesa-vulkan-intel intel-video-accel
  else
    $ADDCMD linux-firmware-amd mesa-dri vulkan-loader mesa-vulkan-radeon mesa-vaapi mesa-vdpau
  fi

  $ADDCMD xorg-server-xwayland
  $ADDCMD river foot kanshi bemenu Waybar mako swaybg swayidle swaylock \
    wlopm libnotify Thunar file-roller xdg-user-dirs-gtk xdg-user-dirs \
    brightnessctl
  xdg-user-dirs-update
  xdg-user-dirs-update --force

  $ADDCMD adwaita-icon-theme

  $ADDCMD xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr

  $ADDCMD pipewire pulseaudio-utils alsa-pipewire
  $DOAS mkdir -p /etc/pipewire/pipewire.conf.d
  $DOAS ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
  $DOAS ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/
  $DOAS mkdir -p /etc/alsa/conf.d
  $DOAS ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
  $DOAS ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d
}

applications() {
  $ADDCMD git htop firefox noto-fonts-cjk noto-fonts-ttf noto-fonts-emoji noto-fonts-ttf
  $ADDCMD helix go nodejs cargo
}
