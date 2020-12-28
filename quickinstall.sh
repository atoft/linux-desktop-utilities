#!/bin/bash

# Quickly install my frequently used software

echo "Adding Syncthing repository"
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

echo "Updating Repository List"
sudo apt-get update -y -q

echo "Installing default GNOME"
sudo apt-get install -y -q gnome-session

echo "Installing GNOME fonts"
sudo apt-get install -y -q fonts-cantarell

echo "Using the default GNOME GDM theme (login skin)"
sudo update-alternatives --set gdm3-theme.gresource /usr/share/gnome-shell/gnome-shell-theme.gresource

echo "Installing CLion"
sudo snap install --classic clion

echo "Installing Flatpak"
sudo apt-get install -y -q flatpak
sudo apt-get install -y -q gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing Spotify"
flatpak install -y flathub com.spotify.Client

echo "Installing GIMP"
sudo apt-get install -y -q gimp

echo "Installing Steam"
sudo apt-get install -y -q steam-installer

echo "Installing VLC Media Player"
sudo apt-get install -y -q vlc

echo "Installling Apostrophe"
flatpak install -y flathub org.gnome.gitlab.somas.Apostrophe

echo "Installing Syncthing"
sudo apt-get install -y -q syncthing

echo "Run Syncthing on startup"
systemctl --user enable syncthing.service

echo "Installing GNOME Web"
sudo apt-get install -y -q epiphany-browser

echo "Installing Geary"
flatpak install -y flathub org.gnome.Geary

echo "Installing Vim"
sudo apt-get install -y -q vim

echo "Applying a nice wallpaper"
# Without sudo so we get the user's home folder and the file isn't owned by root.
wget https://github.com/atoft/wallpaper/raw/master/wallpaper.png -P ~/Pictures
gsettings set org.gnome.desktop.background picture-uri "file:///$HOME/Pictures/wallpaper.png"

echo "Done. To use GNOME, restart the PC and select GNOME from the cog dropdown in the login screen."


