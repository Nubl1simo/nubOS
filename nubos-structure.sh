#!bin/sh
print "Hello, fellow Linux User, welcome to NubOS configuration installation script." # welcome message

read -p "Do you have Arch Linux already installed? [Y/N]" ARCHINSTALLED # Arch Linux installed?
case "$ARCHINSTALLED" in
	[yY] | [yY][eE][sS])
		echo "You have Arch Linux installed, good, the script can proceed."
		function 
		;;
	[nN] | [nN][oO])
		echo "Please install the Arch Linux base system to proceed"
		# please add actual Arch Linux installer
		;;
	*)
		echo "Please  enter a valid option"
		;;
esac

