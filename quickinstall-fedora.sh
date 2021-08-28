#!/bin/bash

# Quickly install my frequently used software
# Tested on Fedora 34

echo "Updating packages"
sudo dnf -y update

echo "Installing Syncthing"
sudo dnf -y install syncthing
systemctl --user enable --now syncthing.service

echo "Setting up Flatpak"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing Emacs"
sudo dnf -y install emacs

echo "Installing Steam"
flatpak install -y flathub com.valvesoftware.Steam

echo "Installing GNOME Web"
flatpak install -y flathub org.gnome.Epiphany

echo "Installing Thunderbird"
sudo dnf -y install thunderbird

echo "Installing GIMP"
flatpak install -y flathub org.gimp.GIMP

echo "Installing Spotify"
flatpak install -y flathub com.spotify.Client

echo "Installing Password Safe"
flatpak install -y flathub org.gnome.PasswordSafe

echo "Applying a nice wallpaper"
# Without sudo so we get the user's home folder and the file isn't owned by root.
wget https://github.com/atoft/wallpaper/raw/master/wallpaper.png -P ~/Pictures
gsettings set org.gnome.desktop.background picture-uri "file:///$HOME/Pictures/wallpaper.png"

echo "All done 🎉"
