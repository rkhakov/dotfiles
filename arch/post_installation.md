# Post Installation

## Create user

```bash
# Install sudo
pacman -S sudo

# Add a new user and create home dir for him
useradd -m ruslan

# Change password for the new user
passwd ruslan

# Add the new user to some group includeing sudo
usermod -aG wheel,audio,video,storage ruslan

# Now make the sudo execute command with root previleges
EDITOR=vim visudo
# uncomment "%wheel ALL=(ALL) ALL" and "%sudo   ALL=(ALL) ALL"
```

## Install base packages

```bash
# Important packages
pacman -S base-devel git wget unzip neofetch

# xorg
pacman -S xorg-server xorg-xinit

# driver
pacman -S xf86-video-intel # intel
pacman -S xf86-video-amdgpu # amd

# lightdm
pacman -S lightdm lightdm-slick-greeter

# i3
pacman -S i3-gaps i3status i3blocks i3lock dmenu nitrogen picom xss-lock

# notification daemon
pacman -S dunst
```

## LightDM settings

```bash
vim /etc/lightdm/lightdm.conf
# [Seat:*]
# ...
# greeter-session=lightdm-slick-greeter
# ...
```

## Install fonts

```bash
sudo mkdir -p /usr/local/share/fonts/ttf/JetBrainsMono
cd /usr/local/share/fonts/ttf/JetBrainsMono

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip

unzip JetBrainsMono.zip
rm JetBrainsMono.zip

pacman -S noto-fonts

fc-cache
```

## Audio

```bash
pacman -S alsa-utils pipewire pipewire-alsa pipewire-pulse
systemctl --user enable pipewire-pulse
# check
pactl info
```

## Touchpad

```bash
pacman -S xf86-input-libinput xorg-xinput xclip

vim /etc/X11/xorg.conf.d/30-touchpad.conf

Section "InputClass"
	Identifier "touchpad"
	Driver "libinput"
	MatchIsTouchpad "on"
	Option "Tapping" "on"
	Option "TappingButtonMap" "lmr"
	Option "ButtonMapping" "1 3 2"
	Option "NaturalScrolling" "true"
EndSection

```
