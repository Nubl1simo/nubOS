#!bin/sh
echo "Hello, fellow Linux User, welcome to NubOS configuration installation script." # welcome message

### INSTALLATION ###
ricing () {

	# Config dirs
	echo " -- STAGE 1 - INSTALLING SOFTWARE       -- "
	sh ./pkg.sh
	echo " - Finished STAGE 1 - "


	echo " -- STAGE 2 - MAKING CONFIG DIRECTORIES -- "
	echo
	mkdir ~/.config/
	echo " Stage 2 - part 1/8	Creating bspwm      config directory"
	mkdir ~/.config/bspwm
	echo " Stage 2 - part 2/8	Creating sxhkd      config directory"
	mkdir ~/.config/sxhkd
	echo " Stage 2 - part 3/8	Creating htop       config directory"
	mkdir ~/.config/htop
	echo " Stage 2 - part 4/8	Creating picom      config directory"
	mkdir ~/.config/picom
	echo " Stage 2 - part 5/8	Creating alacritty  config directory"
	mkdir ~/.config/alacritty
	echo " Stage 2 - part 6/8	Creating picom      config directory"
	mkdir ~/.config/picom
	echo " Stage 2 - part 7/8	Creating vim        config directory"
	mkdir ~/.config/vim
	echo " Stage 2 - part 8/8	Creating vim        config directory"
	mkdir ~/.config/nitrogen

	# Creating configs
	echo " -- STAGE 3 - GENERATING CONFIG FILES -- "
	git clone https://github.com/nubl1simo/dotfiles/
	cd dotfiles
	#.zshrc alacritty.yml bspwmrc htoprc sxhkdrc nitrogen .cfg picom.conf vimrc
	mv .zshrc ~/
	echo " Stage 3 - part 1/7	Generated zsh       config file." 
	mv alacritty.yml ~/.config/alacritty/
	echo " Stage 3 - part 1/7	Generated alacritty config file." 
	mv bspwmrc ~/.config/bspwm/
	echo " Stage 3 - part 1/7	Generated bspwm     config file." 
	mv sxhkdrc ~/.config/sxhkd
	echo " Stage 3 - part 1/7	Generated sxhkd     config file." 
	mv htoprc ~/.config/htop/
	echo " Stage 3 - part 1/7	Generated htop      config file." 
	mv nitrogen.cfg ~/.config/nitrogen/
	echo " Stage 3 - part 1/7	Generated nitrogen  config file." 
	mv picom.conf ~/.config/picom/
	echo " Stage 3 - part 1/7	Generated picom     config file." 
	mv vimrc ~/.config/vim/
	echo " Stage 3 - part 1/7	Generated vim       config file." 

	# Xorg configuration
	cp /etc/X11/xinit/xinitrc ~/.xinitrc
	echo bspwm > ~/.xinitrc
	echo picom > ~/.xinitrc
	echo "nitrogen --set-zoom-fill --random ~/dotfiles/nord-wallpapers-i-like/ --save" > ~/.xinitrc
}

isUserSure () {		#function for asking if user is sure
	echo "Are you sure you want to run this script, this script will install the following software, and the binaries required to run them."
	echo
	echo "bspwm      sxhkd"
	echo "Xorg       xinit"
	echo "alacritty       "
	echo "zsh             "
	echo "ranger     vim        htop       tty-clock"
	echo "nemo       sxiv       vlc        nitrogen   picom"
	echo
	echo "And will configure it to Nublisimo's Liking."
	echo
	read -p "Are you sure? [Y/N]: " ISUSERSURE # Is the user sure they want to install this software?
	echo
	case "$ISUSERSURE" in
		[yY] | [yY][eE][sS])
			echo "Great, the installation will proceed."
			ricing
			;;
		[nN] | [nN][oO])
			echo "Halting installation."
			# please add actual Arch Linux installer
			;;
		*)
			echo "Please  enter a valid option"
			;;
	esac
}

isArchInstalled () {	#function for asking if user has Arch Linux installed.
	echo
	read -p "Do you have Arch Linux already installed? [Y/N]: " ARCHINSTALLED # Arch Linux installed?
	case "$ARCHINSTALLED" in
		[yY] | [yY][eE][sS])
			echo
			echo "You have Arch Linux installed, good, the script can proceed."
			isUserSure
			;;
		[nN] | [nN][oO])
			echo
			echo "Please install the Arch Linux base system to proceed, this script will soon have and Arch Linux installer, but it's still a work in progress."
			# please add actual Arch Linux installer
			;;
		*)
			echo "Please  enter a valid option"
			;;
	esac
}

isArchInstalled
