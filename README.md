# Cuong Phoenix' dotfiles

## 🚀 Setup

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:cuongvuong-phoenix/dotfiles-arch.git
```

# 🧑‍🌾 Manual steps

### 🧹 Avoid collision packages

```sh
paru - Rns cachyos-niri-settings swaylock-effects-git swaylock-fancy-git wlogout mako
```

### 💾 Auto mount Windows partitions

1. Run `sudo blkid` to get the UUIDs
2. Setup `fstab` to something like this
  ```fstab
  UUID=01D79E464BEAB010                     /mnt/SSD       ntfs3   defaults,windows_names,nofail,uid=1000,gid=1000,umask=0022 0 0
  ```

### 🎨 Application themes

> Referenced from the DMS's docs: https://danklinux.com/docs/dankmaterialshell/application-themes#gtk-applications

1. **Setup global env** (already setup by `~/.config/niri/env.kdl`):
	```sh
	QT_QPA_PLATFORM="wayland"
	QT_QPA_PLATFORMTHEME="qt6ct"
	QT_QPA_PLATFORMTHEME_QT6="qt6ct"
	```
2. **Open `qt6ct` & `qt5ct`**:
	- **Style**: Darkly
	- **Color Scheme**: `matugen` OR `catppuccin-mocha-peach` ([Catppuccin doc](https://github.com/catppuccin/qt5ct))
	- **Standard dialogs**: XDG Desktop Portal
	- **Icon Theme**: Papirus-Dark
3. **Sync `qt6ct` & `qt5ct` settings with KDE global settings** (to make KDE apps look the same):
  - If you can install and use `qt6-kde` (i.e. opening `dolphin` without crashing), don't need to do anything
  - If not, add/edit these lines within `~/.config/kdeglobals`
	  ```config
	  [Gennral]
	  widgetStyle=qt6ct-style
	  ColorScheme=qt6ct

	  [Icons]
	  Theme=Papirus-Dark

	  [UiSettings]
	  ColorScheme=qt6ct
	  ```

## 🐛 Troubleshooting

- `nvim` LSP broken? -> Open `:Lazy` (`<Leader>ps`), then press `R` to Restore all plugins to the state in the lockfile.
