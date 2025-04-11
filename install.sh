# create .config folder to prevent softlinked the entired .config to the dotfiles project
mkdir ~/.config

# create .local folder to prevent softlinked the entired .local to the dotfiles project
mkdir ~/.local

sudo apt install -y stow zsh

# stow dotfiles
stow nvim
stow tmux
stow zsh
stow devbox
stow ohmyposh

# install devbox
curl -fsSL https://get.jetify.com/devbox | bash

devbox global install

# install tmux manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins # trigger install plugin command

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

