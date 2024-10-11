#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
XDG_CONFIG_HOME="$HOME/.config"

create_directories() {
  local directories=("$@")
  for dir in "${directories[@]}"; do
    mkdir -p "$dir"
  done
}

create_symlinks() {
  local items=("$@")
  for item in "${items[@]}"; do
    IFS=':' read -r source target <<<"$item"
    target_dir=$(dirname "$target")
    if [ -L "$target" ]; then
      echo "Removing existing symlink $target"
      unlink "$target"
    elif [ -d "$target_dir" ]; then
      echo "Directory exist $target_dir"
    elif [ -e "$target_dir" ]; then
      echo "Removing existing file $target_dir"
      rm -rf "$target_dir"
    fi
    create_directories "$target_dir"
    ln -s "$DOTFILES_DIR/$source" "$target"
    echo "Created symlink for $source"
  done
}

common_items=(
  "waybar/config.jsonc:$XDG_CONFIG_HOME/waybar/config.jsonc"
  "waybar/style.css:$XDG_CONFIG_HOME/waybar/style.css"
  "waybar/power_menu.xml:$XDG_CONFIG_HOME/waybar/power_menu.xml"
  "hypr/hyprland.conf:$XDG_CONFIG_HOME/hypr/hyprland.conf"
  "hypr/hyprpaper.conf:$XDG_CONFIG_HOME/hypr/hyprpaper.conf"
  "wofi/config:$XDG_CONFIG_HOME/wofi/config"
  "wofi/style.css:$XDG_CONFIG_HOME/wofi/style.css"
  "wallpapers/neon.png:$XDG_CONFIG_HOME/wallpapers/neon.png"
  "mako/config:$XDG_CONFIG_HOME/mako/config"
  "kitty/current-theme.conf:$XDG_CONFIG_HOME/kitty/current-theme.conf"
  "kitty/kitty.conf:$XDG_CONFIG_HOME/kitty/kitty.conf"
  "swaylock/config:$XDG_CONFIG_HOME/swaylock/config"
)

create_symlinks "${common_items[@]}"

