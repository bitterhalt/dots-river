# Path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/flatpak-alias/:$PATH"

# Defaults
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="foot"
export BROWSER="librewolf"

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Tidy ~/
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export FZF_DEFAULT_OPTS_FILE="$XDG_CONFIG_HOME/fzf/fzf-opts"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_DATA_HOME/history"
export SSH_AUTH_SOCK="$XDG_DATA_HOME/ssh-agent.sock"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"

# Export dbus address
export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"

# Start River environment
if [ -z "$WAYLAND_DISPLAY" ] && [ $(tty) = "/dev/tty1" ]; then
  $HOME/.local/bin/river-start
fi
