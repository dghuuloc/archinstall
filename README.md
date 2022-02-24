<h1 align="center">
  <a href=https://www.archlinux.org/>Archlinux</a> Ultimate Installer
</h1>
<h4 align="center">Installation & Configuration of archlinux has never been much easier!</h4>

<p align="center">
  <img src="https://img.shields.io/badge/Maintained%3F-Yes-green?style=for-the-badge">
  <img src="https://img.shields.io/github/license/helmuthdu/aui?style=for-the-badge">
  <img src="https://img.shields.io/github/issues/helmuthdu/aui?color=violet&style=for-the-badge">
  <img src="https://img.shields.io/github/stars/helmuthdu/aui?style=for-the-badge">
  <img src="https://img.shields.io/github/forks/helmuthdu/aui?color=teal&style=for-the-badge">
</p>

## Prerequisites

- A working internet connection
- Logged in as 'root'

## Internet Connection

First, test if you already have internet connection, so run:

``` sh
ping google.com
```

## Update System Clock

``` sh
timedatectl set-ntp true
timedatectl status
```

## Partition the Disk

In my case, I'll install arch on `/dev/sda` disk. You partition table should look like this (size may vary):

| Name | Partition | Size            | Type |
| :--: | :-------: | :-------------: | :--: |
| sda1 | `/boot`   | 1G              | EFI  |
| sda2 | `swap`    | 8G              | swap |
| sda3 | `/`       | 100G            | ext4 |
| sda4 | `/home`   | Remaining space | ext4 |


## Reference
- [AUI Arch linux installer](https://github.com/helmuthdu/aui)
- [arch-install - Simple Arch Linux Install Script](https://github.com/tom5760/arch-install)
- [Arch-Linux-Install-Script](https://github.com/Antiz96/Arch-Linux-Install-Script)
-[Arch Linux Installation Guide](https://gist.github.com/eltonvs/d8977de93466552a3448d9822e265e38)
-[How to install Arch Linux](https://github.com/saloniamatteo/Arch#2-partition-the-disk)
