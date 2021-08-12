#!bin/sh

# Nublisimo
#
#	NubOS
#	Nublisimo 1 August 2021
#

## things to add ##
#Xorg and xinit configuration
#pkg.sh

# This installation script consists in 3 main steps
## Confirmation
### Ask if arch is installed or not
#### If no ask if arch-based distro is installed
## Software Installation Preparation
### Make Config Directories
### Git cloning dotfiles
### Configuring Dorfiles
#### Configuring Xorg .xinitrc
## run `sh pkg.sh`


echo "Welcome to nubOS"

# Confirmation

setconfigs() {
	echo "Setting configuration files"
	cd ~/
#	git clone https://github.com/nubl1simo/dotfiles
#	mv ./dotfiles/bspwmrc ~/.config/bspwm/
#	mv ./dotfiles/sxhkdrc ~/.config/sxhkd/
#	mv ./dotfiles/htoprc ~/.config/htop/
#	mv ./dotfiles/picom.conf /.config/picom/
#	mv ./dotfiles/alacritty.yml ~/.config/alacritty/
#	mv ./dotfiles/vimrc ~/.config/vim
#	mv ./dotfiles/nitrogen.cfg ~/.config/nitrogen
#	mv ./dotfiles/user* ~/.config/
}

# Configuration
configdirs() {
	# configuraiton directories
	echo "Making configuration directories."
	mkdir ~/.config/
	mkdir ~/.config/bspwm
	mkdir ~/.config/sxhkd
	mkdir ~/.config/htop
	mkdir ~/.config/picom
	mkdir ~/.config/alacritty
	mkdir ~/.config/vim
	mkdir ~/.config/nitrogen
	echo "Made configuration directories"
	echo
	echo "Installing packages"
	sh pkg.sh
}

confirmation() {

	echo "Are you sure you want to install these packages, not all of them are Libre, but all of them are Open Source"
	echo ""
	echo "bspwm, sxhkd            BSD-2-Clause License		Window Manager"
	echo "Xorg + xinit            GNU General Public License	Xorg" #Fact check that pleaes ###
	echo "Alacritty               Apache 2.0 License		Terminal emulator"
	echo "zsh                     I forgor 💀			Shell"
	echo "ranger                  GNU General Public License 3.0	Terminal File Manager"
	echo "vim                  Apache 2.0 License			Terminal Text Editor"
	echo "htop                    GNU General Public License 2.0	Terminal Process Manager"
	echo "tty-clock               BSD-3-Clause License💀		Terminal Clock Widget"
	echo "sxiv                    GNU General Public License	Suckless Image Viewer" #Fact Check that pls 
	echo "VLC                     GNU General Public License 2.0	Video Player"
	echo "nitrogen                I forgor 💀			Wallpaper utility" #Fact Check that
	echo "picom                   MPL 2.0 AND MIT			Compositor"
	echo "GIMP                    GNU General Public License 2.0	GNU Image Manipulation Program"
	
	read -p "Are you sure [Y/N]" PKGSURE
	case "$PKGSURE" in
		[yY] | [yY][eE][sS])
			echo "Starting Setup."
			#UPDATE
			;;
		[nN] | [nN][oO])
			echo
			echo "Halting Installation"
			echo
			;;
		*)
			echo "Invalid option"
			confirmation
	esac
}


confirmationarch() {
	read -p "Do you have Arch Linux installed on this system? [Y/N]" ARCHINSTALLED
	case "$ARCHINSTALLED" in
		[yY] | [yY][eE][sS])
			echo "The installation can proceed."
			confirmation
			;;
		[nN] | [nN][oO])
			echo "Please run thos script when you've installed Arch Linux"
			;;
		*)
			echo "Invalid option"
			;;
	esac
}

confirmationarch
