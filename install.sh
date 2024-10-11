#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
XDG_CONFIG_HOME="$HOME/.config"

create_symlink_recursive() {
  local source_dir="$1"
  local target_dir="$2"

  # Iterate over all files in the source directory
  find "$source_dir" -type f | while read -r source; do
    # Get the relative path by subtracting DOTFILES_DIR from the full path
    relative_path="${source#$DOTFILES_DIR/}"

    # Construct the full target path inside XDG_CONFIG_HOME using the relative path
    target="$XDG_CONFIG_HOME/$relative_path"

    target_dirname=$(dirname "$target")

    # Create target directories if they do not exist
    if [ ! -d "$target_dirname" ]; then
      mkdir -p "$target_dirname"
      echo "Created directory $target_dirname"
    fi

    # Check if the symlink already exists or if a file already exists at the target location
    if [ -L "$target" ]; then
      echo "Removing existing symlink $target"
      unlink "$target"
    elif [ -e "$target" ]; then
      echo "Removing existing file $target"
      rm -rf "$target"
    fi

    # Create the symlink from source to target
    ln -s "$source" "$target"
    echo "Created symlink from $source to $target"
  done
}

# Run the symlink creation process for each top-level directory in DOTFILES_DIR
for dir in "$DOTFILES_DIR"/*/; do
  create_symlink_recursive "$dir" "$XDG_CONFIG_HOME"
done
ln -s ~/.dotfiles/.zshrc ~/.zshrc
