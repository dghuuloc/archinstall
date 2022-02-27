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
#### Neofetch and htop

```
# sudo pacman -Sy htop neofetch
```

#### Fonts

```
sudo pacman -S --noconfirm ttf-ms-fonts ttf-dejavu ttf-liberation ttf-kochi-substitute ttf-ubuntu-font-family ttf-droid ttf-google-webfonts ttf-roboto
```
Most modern Linux Distros use the fontconfig library to search specific directories for new fonts when the distribution is booted up:

```
# Default Font Paths for fontconfig:
/usr/share/fonts/
~/.local/share/fonts/
```
The first path is for a global install for all users, the second is for a local install for one specific user (‘ ~ ‘ would be their home directory).

**Install Nerd Fonts** 

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
- **How to install zsh-autosuggestions and Syntax Highlighting**

Install zsh-autosuggestions by running:

``` 
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
Install zsh-syntax-highlighting by running:

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```
Now, open `.zshrc` file with your favourite editor:

And simply add `zsh-autosuggestions` & `zsh-syntax-highlighting` to `plugins()` section, it will do the magic for you:

```
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```
### Instaling Packages using `yay -Sy`

#### Download Terminal Tools

- `wget` Download web content
- `curl` Download web content to stdout

``` 
$ yay -Sy wget curl
```
#### Install VSCode

```
$ yay -S visual-studio-code-bin
```

