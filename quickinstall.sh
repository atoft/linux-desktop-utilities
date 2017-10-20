# Quickly install my frequently used software

echo "Adding Repositories"
sudo add-apt-repository ppa:snwh/pulp
sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu precise main"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

echo "Updating Repository List"
sudo apt-get update

echo "Installing Chromium"
sudo apt-get install chromium-browser

echo "Installing Thunderbird"
sudo apt-get install thunderbird

echo "Installing Dropbox"
sudo apt-get install dropbox

echo "Installing Spotify"
sudo apt-get install spotify-client

echo "Installing Steam"
sudo apt-get install steam

echo "Installing VLC Media Player"
sudo apt-get install vlc

echo "Installing Roboto fonts"
sudo apt-get install fonts-roboto

echo "Downloading GNOME Extensions"
sudo wget -O /usr/local/sbin/shell-extension-install https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnome-extension/shell-extension-install
sudo chmod +x /usr/local/sbin/shell-extension-install

#User themes
shell-extension-install 3.18 19
#Dash to Dock
shell-extension-install 3.18 307
#Media player indicator
shell-extension-install 3.18 55
#TopIcons Plus
shell-extension-install 3.18 1031


echo "Installing Paper Theme"
sudo apt-get install paper-icon-theme paper-gtk-theme

echo "Applying Paper Theme"
gsettings set org.gnome.desktop.interface gtk-theme "Paper"
gsettings set org.gnome.shell.extensions.user-theme name "Paper"
gsettings set org.gnome.desktop.interface icon-theme "Paper"



echo "Restarting the GNOME Shell"
gnome-shell -r &
echo "Setting Font"
gsettings set org.gnome.desktop.interface font-name "Roboto"
echo "Restarting the GNOME Shell"
gnome-shell -r &

echo "All done"

#Gnome Tweaks:
#Workspaces: Static 1
#Windows: Minimise
#Fonts: Window Titles Roboto Bold 11, Interface Roboto Regular 11

