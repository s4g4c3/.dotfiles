# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/flo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
eval "$(oh-my-posh init zsh --config ~/.dotfiles/themes/catppuccin_mocha.omp.json)"

