#!/bin/bash

pkg=(
  fastfetch
  mako
  swaylock-effects
  swayidle
  ripgrep
  fd
  zsh
  firefox
  nodejs
  wl-clipboard
  npm
  kitty
  openssh
)

for pkg in "${pkg[@]}"; do
  sudo pacman -S "$pkg" --noconfirm
done

yay -S oh-my-posh
sudo chsh -s /bin/zsh flo
