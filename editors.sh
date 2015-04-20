#!/bin/bash -x
clear

echo "Start of install"
autoinstall(){
	for var in "$@"; do
		apt-get -y install $var
		if [ $? != 0 ]; then
			echo "$var not installed, error."
			exit 1
		else			
			echo "$var Installed succesfully."
		fi
	done
}

autoupdate(){
	apt-get -y update
	if [ $? != 0 ]; then
		echo "That update didn't work out so well. Trying some fancy stuff..."
		sleep 3
		rm -rf /var/lib/apt/lists/* -vf
		apt-get update -f || echo "The errors have overwhelmed us, bro." && exit
	fi
}

if false;then
autoupdate
apt-get upgrade
apt-get dist-upgrade && apt-get autoremove

# add-apt-repository ppa:webupd8team/sublime-text-3
autoupdate
apt-get install sublime-text-installer
wget https://packagecontrol.io/Package%20Control.sublime-package -P ~/.config/sublime-text-3/Installed\ Packages/

# Install extra packages

fi
cp Package\ Control.sublime-settings ~/.config/sublime-text-3/Packages/User/

exit 0