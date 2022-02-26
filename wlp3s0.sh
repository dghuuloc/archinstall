#!/bin/bash

sudo su

echo "Enter your password as root"

pacman -Syy --noconfirm

systemctl disable dhcpcd
ip link set dev wlp3s0 up
dhcpcd wlp3s0
systemctl enable dhcpcd@wlp3s0
systemctl start dhcpcd@wlp3s0
