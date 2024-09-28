#!/bin/bash

sudo pacman -Rns pulseaudio pipewire alsa-utils

audio_pkg=(
  pavucontrol
  pipewire 
  pipewire-pulse 
  pipewire-alsa 
  pipewire-jack
)

for pkg in "${audio_pkg[@]}"; do
  sudo pacman -S "$pkg" --noconfirm
done
