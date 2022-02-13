# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Export nvm completion settings for lukechilds/zsh-nvm plugin
# Note: This must be exported before the plugin is bundled
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETION=true

# Explicitly define language
export LANG=en_US.UTF-8

source ${HOME}/.zsh_plugins.sh

# Set suggestion foreground to grey
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#757575'

# alias
alias update-antibody='antibody bundle < $HOME/.zsh_plugins.txt > $HOME/.zsh_plugins.sh'
alias zshrc='vim ~/.zshrc'
alias ll='ls -al'
alias codes="cd ~/Codes"
alias gritus="cd ~/Codes/gritus"
alias github="cd ~/Codes/GitHub"
alias ccig="cd ~/Codes/ccig"
alias rwldev="nvm use lts/carbon && cd ~/Codes/gritus/rwl-service && NODE_ENV=development yarn start"
alias pcbdev="nvm use lts/carbon && cd ~/Codes/gritus/pcb-service && NODE_ENV=development yarn start"
alias apidev="cd ~/Codes/gritus/local-api-service && NODE_ENV=development yarn dev"
alias mongodev="cd ~/ && run-rs -n 1 -p 27018 -v 4.0.6"
alias devmachine="ssh dukduk-aws-tunnel-prod -L 6000:localhost:6000 -L 6001:localhost:6001 -L 6002:localhost:6002 -L 6003:localhost:6003 -L 6004:localhost:6004 -t './scripts/ssh_retry.sh 5069 -L 6001:localhost:6001 -L 6002:localhost:6002 -L 6000:localhost:6000 -L 6003:localhost:6003 -L 6004:localhost:6004 -t 'ssh tony@192.168.1.211 -L 6000:localhost:80 -L 6001:localhost:54321 -L 6002:localhost:22 -L 6003:localhost:2222 -L 6004:localhost:6004''"
alias dc="docker-compose"
alias sail='./vendor/bin/sail'
alias ansible-playbook="docker run --rm \
 -e USER=ansible \
 -e MY_UID=1000 \
 -e MY_GID=1000 \
 -v $(pwd):/data \
 -v ${HOME}/Codes/gritus/keys:/home/ansible/.ssh/ --net=host \cytopia/ansible:2.6-tools ansible-playbook"
alias composer="php /usr/local/bin/composer.phar"
alias vim="nvim"

# Export PATH
export PATH=$PATH:$HOME/scripts:$HOME/go/bin
export PATH=/usr/local/opt/php@7.2/bin:$PATH
export PATH=/usr/local/opt/php@7.2/sbin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:$HOME/flutter/bin
export PATH=/usr/local/Cellar/vim/8.2.1000/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH


# nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
