# Set the GPG_TTY to be the same as the TTY, either via the env var
# or via the tty command.
if [ -n "$TTY" ]; then
  export GPG_TTY=$(tty)
else
  export GPG_TTY="$TTY"
fi

# Nvim as manpager
export MANPAGER="nvim +Man!"

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Load completions
autoload -Uz compinit && compinit

# Keybindings
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^F" history-incremental-pattern-search-forward
bindkey '^x' autosuggest-toggle
zle_highlight+=(paste:none)

# History
HISTSIZE=5000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/.zsh_history"
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --group-directories-first --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --group-directories-first --color=always $realpath'

# Load aliases and functions if existent.
[ -f "$HOME/.config/shell/aliases" ] && source "$HOME/.config/shell/aliases"
[ -f "$HOME/.config/shell/functions" ] && source "$HOME/.config/shell/functions"

# Shell integrations
eval "$(sheldon source)"            # Plugins
eval "$(fzf --zsh)"                 # Fzf
eval "$(zoxide init --cmd cd zsh)"  # Zoxide
eval "$(starship init zsh)"         # Starship
