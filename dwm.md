---
title: Installing DWM
tags: ["linux", "dwm"]
---

Make sure you have a user already

## Requirements:

```
sudo pacman -Sy xorg xorg-server xorg-xinit xorg-xrandr xorg-xsetroot
sudo pacman -Sy nitrogen lxappearance
yay -Sy picom pnmixer flat-remix-gtk
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

## start dwm

```
# ~/.xinitrc files are not available and need to be added manually
vim ~/.xinitrc

# Add the following code to the.xinitrc file
exec dwm
```

## Basic Commands

- Moving between windows: `[Alt]+[j] or [Alt]+[k]`

- To move a terminal to another tag: `[Shift]+[Alt]+[<TAG_NUMBER>]`

- To focus on another tag: `[Alt]+[tag number]`

- To change the amount of windows in the master area: `[Alt]+[d] (Decrease) or [Alt]+[i] (Increase)`

- To toggle a window between the master and stack area: `[Alt]+[Return]`

- To kill a window: `[Shift]+[Alt]+[c]`

- Click another tag with the right mouse button to bring those windows into your current focus.

- Pressing `[Alt] + [i]` horizontal split. 

- Pressing `[Alt] + [d]` vertical split.

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

```
cp config.def.h config.h
sudo make clean install
sudo systemctl restart lightdm
```

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

## Configuration in Details

- If you are using a terminal emulator other than st, you need to modify the following code in the config.def.h file:

```
/* Modify st to the installed terminal emulator */
static const char *termcmd[] = { "st", NULL};
```

### Change MODKEY
The default MODKEY is the Alt key.

The MODKEY key is changeable, Mod1Mask represents the Alt key, Mod4Mask represents the Window key.

```
#define MODKEY Mod1Mask
```
by

```
#define MODKEY Mod4Mask
```

### Add Command & Define Shortcut

For example, Add flameshot snapshot commands and shortcuts.

```
/* Add Command */
static const char *flameshot[] = { "flameshot", "gui", NULL};

/* Add Shortcut: mod+s */
{ MODKEY,       XK_s,      spawn,        {.v = flameshot } },
```

### DWM patch

Add extra functionality to dwm with patches.

Patch download address: [https://dwm.suckless.org/patches/](https://dwm.suckless.org/patches/)

Patch up
Place the patch file in the dwm directory.Patch with the patch command.

If the patch fails, it needs to be added manually.

Example:

Patch to hide labels that are not running.

```
patch < dwm-hide_vacant_tags-6.2.diff
```

Recommended patches

```
Transparent patch: alphasystray.diff

Temporary small window: dwm-scratchpad-6.2.diff

Hide empty labels: dwm-hide_vacant_tags-6.2.diff

Window spacing: dwm-vanitygaps-20190508-6.2.diff

Autostart script: dwm-autostart-20161205-bb3bd6f.diff

Window Full Screen: dwm-actualfullscreen-20191112-cb3f58a.diff

The status bar displays multiple window information: dwm-awesomebar-20191003-80e2a76.diff
```

### Display information on the right side of the status bar

Use the xsetroot command to display the required information on the right side of the dwm status bar.

```
# Use the xsetroot command to display "hello dwm" on the right side of the status bar
xsetroot -name "hello dwm"
```

With the dwm-autostart-20161205-bb3bd6f.diff patch and custom script, you can display the required system information at system startup.

Example:

When the system starts, the system time is displayed on the right side of the status bar.

After typing dwm-autostart-20161205-bb3bd6f.diff, the following code was found in the dwm.c file:

```
void
runAutostart(void) {
  system("cd ~/scripts; ./autostart_blocking.sh")
  system("cd ~/scripts; ./autostart.sh &")
}
```

You can modify to a directory of custom scripts.

```
void
runAutostart(void) {
  system("cd ~/dwm/scripts; ./autostart.sh &")
}
```

The contents of the autostart.sh script are as follows:

```
#!/bin/sh

dwm_date () {
  date '+%Y year%m month%d day %a %H:%M'
}

while true
do
  xsetroot -name "$(dwm_date)"
  sleep 1
done
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

- [Template](https://www.youtube.com/watch?v=Kkf68ZRZ5ZU)
- [How I use dwm](https://ratfactor.com/dwm2)
- [How to use dwm without dying in the attempt](https://blog.juancastro.xyz/en/posts/dwm/)
- [dwm: A Minimalist Tiling Window Manager For Linux](https://www.maketecheasier.com/dwm-tiling-window-manager/)
- [DWM: A newbie's guide](https://sites.google.com/site/lazyboxx/-articles/dwm-a-newbie-s-guide)
- [Getting Started Dynamic Window Manager (DWM)](https://www.yanboyang.com/dwm/)
- [Tutorial](https://dwm.suckless.org/tutorial/)
- [Dave's Visual Guide to dwm](https://ratfactor.com/dwm)
- [Dwm: The Suckless Window Manager](https://dev.to/l04db4l4nc3r/dwm-the-suckless-window-manager-1ji)
