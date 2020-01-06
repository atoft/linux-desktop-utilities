#!/bin/bash

# Quickly install my frequently used software

if [[ $EUID -ne 0 ]]; then
   echo "Use sudo to run this script. Type sudo ./quickinstall.sh" 
   exit 1
fi

echo "Updating Repository List"
apt-get update -y -q

echo "Installing default GNOME"
apt-get install -y -q gnome-session

echo "Using the default GNOME GDM"
update-alternatives --set gdm3.css /usr/share/gnome-shell/theme/gnome-shell.css 

echo "Removing the Amazon launcher"
apt purge -y ubuntu-web-launchers 

echo "Installing CLion"
snap install --classic clion

echo "Installing Spotify"
snap install spotify

echo "Installing Steam"
apt-get install -y -q steam-installer

echo "Installing VLC Media Player"
apt-get install -y -q vlc

echo "Applying a nice wallpaper"
wget https://github.com/atoft/wallpaper/raw/master/wallpaper.png -P ~/Pictures
gsettings set org.gnome.desktop.background picture-uri "file:///$HOME/Pictures/wallpaper.png"

echo "Done. To use GNOME, restart the PC and select GNOME from the cog dropdown in the login screen."


