# PATH
export PATH="$HOME/.local/bin:$PATH"

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Path
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
export SSH_AUTH_SOCK="$XDG_CACHE_HOME/ssh-agent.sock"
export DOTBARE_BACKUP="${XDG_DATA_HOME:-$HOME/.local/share}/dotbare"
export DOTBARE_DIR="$HOME/Documents/.dots/"
export DOTBARE_TREE="$HOME"

# Start River environment
if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec $HOME/.local/bin/river-start
fi
