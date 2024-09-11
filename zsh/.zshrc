# devbox -- some binary might depends on devbox as package manager
eval "$(devbox global shellenv --init-hook)"
if [ -e /home/tony/.nix-profile/etc/profile.d/nix.sh ]; then . /home/tony/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Set the directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if not downloaded
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::ssh-agent

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e

# Oh my posh prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ENV
export GOPATH=$HOME/go 
export PATH=$PATH:$GOPATH/bin
export XDG_DATA_DIRS=$XDG_DATA_DIRS:$HOME/.local/share/devbox/global/default/.devbox/nix/profile/default/share

# Alias
alias ls='lsd'
alias ll='lsd -l'
alias vim='nvim'
alias n='nvim'
alias dc='docker compose'
alias lg='lazygit'

# Shell integrations
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"

