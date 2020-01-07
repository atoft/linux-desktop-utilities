#!/bin/bash

# Quickly install my frequently used software

echo "Updating Repository List"
sudo apt-get update -y -q

echo "Installing default GNOME"
sudo apt-get install -y -q gnome-session

echo "Using the default GNOME GDM"
sudo update-alternatives --set gdm3.css /usr/share/gnome-shell/theme/gnome-shell.css 

echo "Removing the Amazon launcher"
sudo apt purge -y ubuntu-web-launchers 

echo "Installing CLion"
sudo snap install --classic clion

echo "Installing Spotify"
sudo snap install spotify

echo "Installing Steam"
sudo apt-get install -y -q steam-installer

echo "Installing VLC Media Player"
sudo apt-get install -y -q vlc

echo "Fixing Calculator integration"
snap remove gnome-calculator
sudo apt-get install -y -q gnome-calculator

echo "Applying a nice wallpaper"
# Without sudo so we get the user's home folder and the file isn't owned by root.
wget https://github.com/atoft/wallpaper/raw/master/wallpaper.png -P ~/Pictures
gsettings set org.gnome.desktop.background picture-uri "file:///$HOME/Pictures/wallpaper.png"

echo "Done. To use GNOME, restart the PC and select GNOME from the cog dropdown in the login screen."


