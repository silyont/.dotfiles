# Install nix
sh <(curl -L https://nixos.org/nix/install)

# Source nix to current shell
. ~/.nix-profile/etc/profile.d/nix.sh

# Install packages
nix-env -iA \
    nixpkgs.antibody \
	nixpkgs.git \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.yarn \
    nixpkgs.fzf \
    nixpkgs.zsh \
    nixpkgs.codespell

# stow dotfiles
stow nvim
stow tmux
stow zsh

# install tmux manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins # trigger install plugin command

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# install neovim plugins
nvim --headless +PlugInstall +qall
