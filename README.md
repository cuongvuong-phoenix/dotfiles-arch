# Cuong Phoenix' dotfiles

## Setup

Using `chezmoi` to init this repository:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

## Manual steps

### Auto mount Windows partitions

1. Run `sudo blkid` to get the UUIDs
2. Setup `fstab` to something like this
  ```fstab
  UUID=01D79E464BEAB010                     /mnt/SSD       ntfs-3g defaults,windows_names,big_writes,nofail,uid=1000,gid=1000,umask=0022 0 0
  ```

### Customize KDE as the primary portals

1. **Setup global env**:
```bash
QT_QPA_PLATFORM="wayland"
QT_QPA_PLATFORMTHEME="qt6ct"
```
2. **Open `qt6ct`**:
	- **Style**: Darkly
	- **Color Scheme**: `catppuccin-mocha-peach`
	- **Standard dialogs**: XDG Desktop Portal
	- **Icon Theme**: Papirus-Dark
3. **Sync `qt6ct` settings with KDE global settings** (to make KDE apps look the same): Edit these lines within `~/.config/kdeglobals`
	```TOML
	[General]
	widgetStyle=qt6ct-style
	ColorScheme=qt6ct

	[Icons]
	Theme=Papirus-Dark

	[UiSettings]
	ColorScheme=qt6ct
	```
