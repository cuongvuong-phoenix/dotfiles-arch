#!/bin/bash

printf "\n======== Install packages ========\n"
PACKAGES=(
  "chezmoi"

  # IMPORTANT
  "niri"
  "dms-shell-bin"
  "polkit-kde-agent"
  "sddm"
  "sddm-silent-theme"

  # Essentials
  "awww-git"
  "qt5ct"
  "qt6ct"
  "darkly-bin"
  "papirus-icon-theme"
  "papirus-folders-catppuccin-git"
  "dolphin"
  "archlinux-xdg-menu"
  "xdg-desktop-portal-kde" # Use KDE for most portals instead of ugly Gnome/GTK

  "yazi"
  "xdg-desktop-portal-termfilechooser-hunkyburrito-git" # Use `yazi` for the File Chooser portal

  "microsoft-edge-stable-bin"

  "ttf-jetbrains-mono-nerd"
  "bibata-cursor-theme-bin"
  "fcitx5-im"
  "fcitx5-bamboo"
  "whitesur-gtk-theme"

  "ntfs-3g" # Mount NTFS (Windows) partitions

  # Security & Privacy
  "prek-bin" # `pre-commit` re-engineered in Rust
  "bitwarden"
  "1password"
  "cloudflare-warp-bin"
  "proton-vpn-gtk-app"

  # Terminal
  "kitty"
  "alacritty" # For backup after `kitty`
  "tmux"
  "mise"
  "ripgrep"
  "fd"
  "eza"
  "starship"
  "zoxide"
  "fish"
  "fisher"
  "lazygit"
  "git-delta" # For `lazygit` diff view
  "dust"
  "tokei"
  "jdupes" # `yazi` plugin
  "ouch" # `yazi` plugin

  # Development
  "nvim"
  "zed"
  "android-studio"

  "just"
  "rustup"
  "mold" # Fastest linker to improve Rust compile time
  "clang"
  "sccache"
  "go"
  "libyaml" # To install ruby
  "postgresql"
  "duckdb-bin"

  "claude-code"

  # File Transfer
  "syncthing"
  "qbittorrent"
  "xdman-beta-bin"

  # Media & Utilities
  "wayscriber-bin"
  "qimgv"
  "gimp"
  "vlc"
  "mpv"
  "spotify"
  "obsidian"
  "rustdesk-bin"
  "qdirstat-bin"

  # Social
  "ferdium-bin"
  "slack-desktop"

  # Extras
  "vivaldi"
)
paru -Sy --needed "${PACKAGES[@]}"

