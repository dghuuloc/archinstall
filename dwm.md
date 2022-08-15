---
title: Installing DWM
tags: ["linux", "dwm"]
---

Make sure you have a user already

## Install Xorg

```
pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot
```

## Install git

```
pacman -S git
```

## Create a config directory (if it's not existing ..)

```
mkdir ~/.config
```

## Install DWM

```
git clone git://git.suckless.org/dwm ~/.config/dwm
git clone git://git.suckless.org/st ~/.config/st
git clone git://git.suckless.org/dmenu ~/.config/dmenu
```

```
cd ~/.config/dwm && sudo make install
cd ~/.config/st && sudo make install
cd ~/.config/dmenu && sudo make install
```

## Installing a Display Manager (DM)

```
pacman -S lightdm

pacman -S lightdm-gtk-greeter

pacman -S lightdm-gtk-greeter-settings
```

## Enable lightdm service

```
sudo systemctl enable lightdm
```

## Adding an entry for DWM in the DM

Open this file:

```
mkdir /usr/share/xsessions

vim /usr/share/xsessions/dwm.desktop
```

Add the following:

```
[Desktop Entry]
Encoding=UTF-8
Name=Dwm
Comment=the dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession
```

## Basic Commands

- Moving between windows: `[Alt]+[j] or [Alt]+[k]`

- To move a terminal to another tag: `[Shift]+[Alt]+[<TAG_NUMBER>]`

- To focus on another tag: `[Alt]+[tag number]`

- To change the amount of windows in the master area: `[Alt]+[d] (Decrease) or [Alt]+[i] (Increase)`

- To toggle a window between the master and stack area: `[Alt]+[Return]`

- To kill a window: `[Shift]+[Alt]+[c]`

- Click another tag with the right mouse button to bring those windows into your current focus.

## Layouts

( **Note** ) By default dwm is in tiled layout mode.

- Tiled: `[Alt]+[t]`

- Floating: `[Alt]+[f]`

- Monocle: `[Alt]+[m]`

Further layout modes can be included through patches.

## Floating

To resize the floating window: `[Alt]+[right mouse button]`

To move it around `[Alt]+[left mouse button]`

**Floating in Tiled Layout**

- Toggle floating mode on the active window: `[Alt]+[Shift]+[space]`

- Resize the window: `[Alt]+[right mouse button]`

- toggle it in being floating `[Alt]+[middle mouse button]`

If you want to set some type of window to be always floating, look at the config.def.h and the rules array, where the last but one element defines this behaviour.

## Quitting

To quit dwm cleanly: `[Shift]+[Alt]+[q]`

## Status

By default dwm is showing dwm-X.X in its statusbar. This text can be changed by setting the WM_NAME property of the root window.

Using the tools of X.org, this can be set using:

```
xsetroot -name "Some Text"
```

## Understanding `config.h` and `config.def.h`

- `config.def.h` is the default configuration, and the one patches modify. `config.h` is the actual configuration that is used when compiling. If no `config.h` file exists, make will create it by copying `config.def.h`.

- Having a default allows patches to change the configuration without merge issues (if no other patches were applied before). Then you can compare the changes with your customized `config.h`.

- `config.h` doesn't exist before `make`, unless you add your own.

- `config.def.h` is the default config that "builds" `config.h` So it's the place where the authors can freely change, and the patches will target.

## Configuration 

All of configuration should be in config.def.h` file.
When you mke modified, please run:

```
rm config.h
sudo make clean install
```

```
sudo cp config.def.h config.h
sudo make clean install
sudo systemctl restart lightdm
```

## Git Overview

- Git is a distributed version control system
- Commands we need:
  - `git clone` (download a repository from the web)
  - `git branch` and `git switch` (separate changes)
  - `git add` and `git commit` (register changes)
  - `git diff` (compare files to last registered version)
  - `git status`, `git log` (confirm actions)

## References

- [Getting Started Dynamic Window Manager (DWM)](https://www.yanboyang.com/dwm/)
