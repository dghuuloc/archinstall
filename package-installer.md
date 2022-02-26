## Some Package You Need to Install After Setting System

### Instaling Packages using `pacman -Sy`

### Audio

```
sudo pacman -Sy pulseaudio pulseaudio-alsa pavucontrol bluez bluez-utils alsa-lib alsa-plugins alsa-utils
```

#### Graphic Drivers

```
$ sudo pacman -Sy libgl xf86-video-intel xf86-video-vesa mesa libva-intel-driver nvidia nvidia-settings nvidia-utils
```

```
# sudo pacman -Sy htop neofetch
```

#### Fonts

```
sudo pacman -S --noconfirm ttf-ms-fonts ttf-dejavu ttf-liberation ttf-kochi-substitute ttf-ubuntu-font-family ttf-droid ttf-google-webfonts ttf-roboto
```

Install Nerd Fonts 

```
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh
makepkg -si
sudo rm -rfv nerd-fonts
```

#### ZSH

Frist off, start by installing zshrc and fonts for terminal

```
$ sudo pacman -Sy --needed zsh
```
Then install oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

#### Download Terminal Tools

- `wget` Download web content
- `curl` Download web content to stdout

``` 
$ sudo pacman -Sy wget curl
```

### Instaling Packages using `yay -Sy`

