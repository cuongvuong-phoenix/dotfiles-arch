#!/bin/bash

PACKAGES=(
  # IMPORTANT
  "niri"
  "dms-shell-bin"
  "polkit-kde-agent"
  "sddm"
  "sddm-silent-theme"

  # Essentials
  "yazi"
  "microsoft-edge-stable-bin"
  "ttf-jetbrains-mono-nerd"
  "bibata-cursor-theme-bin"
  "fcitx5-im"
  "fcitx5-bamboo"
  "whitesur-gtk-theme"

  # Security
  "1password"

  # Terminal
  "kitty"
  "alacritty" # Just for backup
  "tmux"
  "mise"
  "starship"
  "zoxide"
  "fish"
  "lazygit"
  "git-delta" # For `lazygit` diff view
  "nvim"
  "zed"
  "dust"
  "tokei"
  "jdupes" # `yazi` plugin
  "ouch" # `yazi` plugin

  # Development
  "rustup"
  "libyaml" # To install ruby
  "postgresql"
  "duckdb"

  # File Transfer
  "syncthing"
  "qbittorent"
  "xdman-beta-bin"

  # Media & Utilities
  "qimgv"
  "gimp"
  "vlc"
  "mpv"
  "spotify"
  "obsidian"

  # Privacy
  "cloudflare-vpn-gtk-app"
  "proton-vpn-gtk-app"

  # Social
  "ferdium-bin"
  "slack-desktop"

  # Extras
  "vivaldi"
  "ntfs-3g" # Mount NTFS (Windows) partitions
)
paru -S "${PACKAGES[@]}"

# Yazi - install plugins
ya pkg install

# Tmux - install plugins
~/.tmux/plugins/tpm/bin/install_plugins

# Mise - install runtimes
mise install


