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
sudo pacman -S --noconfirm ttf-ms-fonts ttf-dejavu ttf-liberation ttf-kochi-substitute ttf-ubuntu-font-family ttf-droid ttf-google-webfonts ttf-roboto ttf-opensans ttf-proggy-clean ttf-roboto ttf-monoid ttf-nerd-fonts-symbols
```
Most modern Linux Distros use the fontconfig library to search specific directories for new fonts when the distribution is booted up:

```
# Default Font Paths for fontconfig:
/usr/share/fonts/
~/.local/share/fonts/
```
The first path is for a global install for all users, the second is for a local install for one specific user (‘ ~ ‘ would be their home directory).

**Install Nerd Fonts** 

- Install nerd-fonts-hack:

```
git clone https://aur.archlinux.org/nerd-fonts-hack.git
cd nerd-fonts-hack
makepkg -si
cd $HOME
sudo rm -rfv nerd-fonts-hack
```
- Install code fonts

```
yay -S nerd-fonts-fira-code nerd-fonts-hermit
```
If youhave added the fonts to system-wide (i.e. `usr/share/fonts/` or `usr/loacl/share/fonts/` location), run:

```
sudo fc-cache -fv
```

##### Add Glyphs In Your Code With Nerd Fonts

I am going to download Font Linux icons using command:

```
$ wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/bin/scripts/lib/i_linux.sh -P ~/.local/share/fonts/
```
Source the download script:

```
$ source ~/.local/share/fonts/i_linux.sh
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
#### [Ranger Fie Manager](https://linuxconfig.org/introduction-to-ranger-file-manager)

We can install `ranger` package from the Community repository by using the `pacman` package manager:

```
$ sudo pacman -Sy ranger
```
One important thing we must do the first time we use ranger, is to copy the default configuration files in the local `~/.config/ranger` directory

```
$ ranger --copy-config=all
```
Visualize hidden files. In the `rc.cong` file in ranger directory, we set this following code:

```
set show hidden true
```
#### Zathura

A vim-like document viewer that supports many types of files including EPUBs, PDFs, and even Comic Books

```
$ sudo pacman -Sy zathura --noconfirm
```
#### Flameshot

```
$ sudo pacman -Sy flameshot --noconfirm
```

Use flameshot in terminal

```
$ flameshot gui
```

#### Install ripgrep Tool

Ripgrep is a line oriented search tool which combines the usefulness of the silver searcher and the speed of GNU grep.

```
sudo pacman -Sy ripgrep
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
#### [Install Polybar](https://computingforgeeks.com/install-polybar-status-bar-on-fedora/)

```
$ yay -S polybar
```
Note, We will install `polybar-bin`

On i3 side, there is a definition for launching polybar

```
exec_always --no-startup-id $HOME/.config/polybar/launch.sh
```
#### ColorPicker

```
yay -Sy colorpicker
```

