#!/bin/bash

audio_pkg=(
  bluez 
  blueman 
  blueman-utils 
)

for pkg in "${audio_pkg[@]}"; do
  sudo pacman -S "$pkg" --noconfirm
done
