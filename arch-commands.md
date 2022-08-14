
# PACMAN

view logs: /var/log/pacman.log

## Update system

```
sudo pacman -Syu
```

## List installed packages

```
sudo pacman -Q
```

## List packages no longer required by others

```
sudo pacman -Qdtq
```

## Search installed packages

```
sudo pacman -Qs <package-name>
```

## Install Packages

```
sudo pacman -Syu <packages-name>
```

## Uninstall/remove packages, its dependencies and config file backups

```
sudo pacman -Rcns <package-name>
```

## Clean old packages in cache
```
sudo pacman -Sc
```

# SYSTEMD

unit files: /usr/lib/systemd/system/ or /etc/systemd/system/

## List running units

```
systemctl
```

## Check status

```
systemctl status <unit>
```

## start/stop a service

```
systemctl (start|stop) <unit>
```

## enable/disable a service at bootup

```
systemctl (enable|disable) <unit>
```

## reload systemd

```
systemctl daemon-reload
```

# Manual Install of AUR packages

## Update repositories

```
sudo pacman -Sy
```

## grab the package

```
curl -O <url> (e.g. https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz)
```

## Untar package

```
tar xzvf <package.tar.gz
```

## Change into package directory

```
cd <package|directory>
```

## Build an Install

```
makepkg -si
```

# Java Environments

## Check status

```
archlinux-java status
```

## Set default version

```
archlinux-java set <version>
```
