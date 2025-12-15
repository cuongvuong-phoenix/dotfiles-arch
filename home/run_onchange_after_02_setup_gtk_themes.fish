#!/bin/fish
printf "\n======== [GTK theme] ========\n"

gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-Dark'
echo "✅ Set `gtk-theme` to 'WhiteSur-Dark'"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
echo "✅ Set `color-scheme` to 'prefer-dark'"
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
echo "✅ Set `icon-theme` to 'Papirus-Dark'"
gsettings set org.gnome.desktop.interface font-name 'Noto Sans, 10'
echo "✅ Set `font-name` to 'Noto Sans, 10'"

echo "🔍 You can inspect the new GTK theme by installing `gtk4-demos` and `gtk3-demos`."
