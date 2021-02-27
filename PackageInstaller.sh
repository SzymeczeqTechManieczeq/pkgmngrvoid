#!/bin/bash
sudo xbps-install -S git
sudo xbps-install -S firefox
echo type 1 if you want to use flatpak
echo type 2 if you want to use xbps-install
echo type 3 if you want to use xbps-src
echo type 8 if you wanto to download xbps-src
echo type 9 if you want to download flatpak
read method
if [ $method = 1 ] 
then
	firefox https://flathub.org/home
fi
if [ $method = 2 ] 
then
	echo type name of package which you want to install
	read package 
	sudo xbps-install -S void-repo-multilib-nonfree
	sudo xbps-install -S void-repo-multilib
	sudo xbps-install -S $package
fi
if [ $method = 3 ] 
then
	cd ~
	cd void-packages
	sudo echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf
	echo type name of package which you want to download
	read packagesrc
	sudo ./xbps-src pkg $packagesrc
	cd ~
	cd void-packages
	sudo xi $packagesrc
fi
if [ $method = 8 ]
then
	sudo xbps-install -S curl util-linux coreutils binutils git xtools
	cd ~
	git clone git://github.com/void-linux/void-packages.git
	cd void-packages
	./xbps-src binary-bootstrap
	sh PackageInstaller.sh
fi	
if [ $method = 9 ]
then
	sudo xbps-install -S flatpak
	echo now you can install things from flatpack!
	sleep 1
	firefox https://flathub.org/home
fi
