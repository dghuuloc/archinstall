#!/bin/bash

# Arch Linux Fast Installer

echo "--------------------------------------"
echo "-- Arch Install on Main Drive       --"
echo "--------------------------------------"

pacstrap /mnt base linux linux-firmware git nano intel-ucode btrfs-progs --noconfirm --needed
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

echo "--------------------------------------"
echo "-- Bootloader Systemd Installation  --"
echo "--------------------------------------"
pacman -S --needed --noconfirm grub grub-btrfs efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# Install packages
pacman -S --needed networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools base-devel linux-headers xdg-user-dirs xdg-utils inetutils bluez bluez-utils cups alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion reflector acpi git flatpak acpid terminus-font

systemctl enable NetworkManager
# systemctl enable bluetooth
# systemctl enable cups
systemctl enable reflector.timer
systemctl enable fstrim.timer
