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

If your ethernet is not working then try the following:

__Connect to Wifi__

```
root@archiso ~ # iwctl
[iwd]# device list
[iwd]# station wlan0 scan
[iwd]# station wlan0 get-networks
[iwd]# station wlan0 connect "Name of Network/WiFi"
[iwd]# exit
```

```
ip link 
```

This will show you a number that looks something like  enp39s0

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

**First list your disks**

```
fdisk -l
```
You should see your disk in here mine is called /dev/sda (WARNING do not write to any of these disks unless you know it's the one you want to install Arch on)

**Now choose the disk you wish to partition**

``` 
fdisk /dev/sda
```

You should now be in the fdisk utility you can press `m` for help

All of uor partitions will be **GPT** partitions so you can press `g` when ready

We will be create 4 partitions for the following:

- boot
- swap
- root
- home

## Format the partitions:

We have to create 4 files systems here, so let's get started

- Format the EFI partition with:

``` 
mkfs.fat -F32 /dev/sda1
```

- Create a swap file

```
mkswap /dev/sda2
swapon /dev/sda2
```

- Format the Root partition with:

``` 
mkfs.ext4 /dev/sda3
```

- Format the Home partition with:

``` 
mkfs.ext4 /dev/sda4
```

## Mount the filesystems

You will need to mount sda1, sda3 and sda4, but you need to mount Root first

- Mount sda3 (ROOT)

``` 
mount /dev/sda3 /mnt
```
- Mount sda1 (BOOT)
```
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
``` 
- Mount sda4 (Home)

```
mkdir /mnt/home
mount /dev/sda4 /mnt/home
```

### Check mounts are correct

You can run `df` to make sure your mounts are in the right place

## Check The Mirror List

### 1.Start by syncing the `pacman` repository:

```
pacman -Syy
```
### 2. Installing a reflector

```
pacman -S reflector
```
### 3. Create a backup of the mirror list:

``` 
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
```

### 4. Use the reflector to update the mirror list:

```
reflector -c "Vietnam" -c "Singapore" -c "Japan" -c "India" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
```
### 5. Enable reflector

```
systemctl enable reflector.timer
```

## Install essential packages (and a few others)

Run the following:

```
pacstrap /mnt base base-devel linux linux-firmware vim intel-ucode sudo linux-headers networkmanager git
```
If you have an intel processor also include `intel-ucode`, for AMD `amd-ucode`

## Configure the system

### Fstab

Generate UUIDs for newly created filesystem

```
genfstab -U /mnt >> /mnt/etc/fstab
```

You can check that it worked by printing the file:

```
cat /mnt/etc/fstab
```

### Chroot

Now you can change root into the new system:

```
arch-chroot /mnt
```

### Time zone

Set the time zone:

```
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
```

For example,

```
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
```
Just search through /usr/share/zoneinfo until you find your nearest City

Run `hwclock`:

```
hwclock --systohc --utc
```
And check the time

```
date
```

### Localization

Uncommnent `en_US.UTF-8 UTF-8` and other needed locales with:

```
vim /etc/locale.gen
```

```
locale-gen
```

Create the `locale.conf` file, and set LANG variable

```
touch /etc/locale.conf

echo LANG=en_US.UTF-8 >> /etc/locale.conf
```

## Network configuration

Create `hostname` file:

```
touch /etc/hostname

echo myhostname >> /etc/hostname
```

In my case, I will name myhostname with `machine`. You can call it anything you want

Add matching entries to `hosts`

```
vim /etc/hosts

127.0.0.1	  localhost
::1		      localhost
127.0.1.1	  myhostname.localdomain  myhostname
```

Note, Your terminal will display with `username@myhostame`

## Root password

Change the root password:

```
passwd
```

## Boot loader

We'll be using grub because it has the biggest presence in the boot loader world

```
pacman -S grub efibootmgr os-prober mtools
```
Create the directory where EFI partition will be mounted

```
[root@archiso /]# mkdir /boot/efi
```

Mount the ESP partition

```
[root@archiso /]# mount /dev/sda1 /boot/efi
```
Now let's install our boot loader

```
[root@archiso /]# grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
```

Finally, generate the /boot/grub/grub.cfg file

```
[root@archiso /]# grub-mkconfig -o /boot/grub/grub.cfg
```

## Add a user

- Add user

```sh
useradd -m -g wheel <your_user>
```

- Create password

```sh
passwd <your_user>
```

## Switch users

To switch to your user run:

```sh
su <your_user>
```

## Giving your user access to sudo

Make sure you have `vi` installed

Enter:

```sh
visudo
```

and uncomment this line so it looks like this

```sh
%wheel ALL=(ALL) ALL
```

if you hate typing your password everytime like me do this instead

```sh
%wheel ALL=(ALL) NOPASSWD: ALL
```

## Installing more packages

Here we can install a few more packages for networking and things like man pages

```
pacman -S man-db man-pages texinfo inetutils netctl dhcpcd networkmanager wpa_supplicant dialog linux-headers network-manager-applet mtools dosfstools xdg-user-dirs xdg-utils cups pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion acpi acpid terminus-font
```

## You're done

Enter `exit` then `reboot`

```
exit
umount -a
reboot
```
or

```
exit
umount -R /mnt
reboot
```

## After Rebooting,

We need to switch root in order to enable network 

## Setup your network

```
ping archlinux.org
```
## Enable NetworkManager service

```
systemctl start NetworkManager.service

systemctl enable NetworkManager.service
```

## Enable internet service

```
systemctl start dhcpcd.service

systemctl enable dhcpcd.service
```
## Connect to Network

```
nmtui
```

## Install the Xorg display server

```
pacman -S xorg xorg-server xorg-xinit
```

## Install the Xorg Terminal

```
pacman -S xterm
```

## Installing a DM

```
pacman -S lightdm

pacman -S lightdm-gtk-greeter

pacman -S lightdm-gtk-greeter-settings
```
Here are GDM Display Manager options:

```
[root@archiso /]# pacman -S gdm

systemctl enable gdm.service
systemctl start gdm.service
```
## Enable lightdm service

```
systemctl enable lightdm
```

## List our enabled services

```
systemctl list-unit-files --state=enabled
```

## Install i3wm (or any WM or DE)

```
pacman -S i3 dmenu feh rofi
echo "exec i3 >> ~/.xinitrc
```

## Install audio

```
pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-jack alsa-utils playerctl
```

### Enable `pulseaudio`

``` 
systemctl --user enable pulseaudio
```

I'm using i3 but you can install any WM or DE you like best

Here are some WM options:

- dwm
- awesome
- bspwm
- xmonad

Here are some DE options:

- XFCE
- KDE
- Gnome

### Install DE (Optional)

```
pacman -S xfce4
```

## Install a terminal emulator

```
pacman -S alacritty
```

I'm using Alacritty but you can install any terminal emulator you want

Here are some options:

- st
- rxvt-unicode
- termite
- terminator

## Install Fonts

```
pacman -S ttf-dejavu ttf-droid ttf-hack ttf-font-awesome ttf-lato ttf-liberation ttf-linux-libertine ttf-opensans ttf-roboto ttf-ionicons ttf-nerd-fonts-symbols ttf-bitstream-vera ttf-croscore noto-fonts ttf-ibm-plex
```

## Install AUR
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -rfv yay
```

## Install Browser

We will install `Brave` 

``` 
yay -S brave
```

Note, choose `brave-bin`

You can now reboot into your new system!

```
reboot
```


## Reference
- [AUI Arch linux installer](https://github.com/helmuthdu/aui)
- [arch-install - Simple Arch Linux Install Script](https://github.com/tom5760/arch-install)
- [Arch-Linux-Install-Script](https://github.com/Antiz96/Arch-Linux-Install-Script)
-[Arch Linux Installation Guide](https://gist.github.com/eltonvs/d8977de93466552a3448d9822e265e38)
-[How to install Arch Linux](https://github.com/saloniamatteo/Arch#2-partition-the-disk)
