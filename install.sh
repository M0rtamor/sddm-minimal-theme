#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi


if [ -d "/usr/share/sddm/themes/" ]; then
	sudo cp -r minimal /usr/share/sddm/themes/
	echo "Theme copied to /usr/share/sddm/themes/"
else
	echo "/usr/share/sddm/themes/ does not exist"
	echo "Theme not installed"
	exit 1
fi

USER="$1"
sudo sed -i "s/^userName=.*/userName=$USER/g" /usr/share/sddm/themes/minimal/theme.conf

if [ -f "/etc/sddm.conf.d/theme.conf" ]; then
	sudo sed -i "s/^Current=.*/Current=minimal/g" /etc/sddm.conf.d/theme.conf
	echo "Theme added to /etc/sddm.conf.d/theme.conf"
fi

if [ -f "/etc/sddm.conf" ]; then
	sudo sed -i "s/^Current=.*/Current=minimal/g" /etc/sddm.conf
	echo "Theme added to /etc/sddm.conf"
fi
