#!/bin/bash
echo "#### Adding repository for Spotify ####"
echo "deb http://repository.spotify.com stable non-free" | sudo tee -a /etc/apt/sources.list > /dev/null
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E9CFF4E


sudo apt-get update

packages="build-essential
network-manager-openvpn-gnome
myunity
vim
git
foremost
tcpflow
tcpxtract
bless
zenmap
nmap
clamav-freshclam
clamav
apcalc
screen
manpages-dev
php5-cli
python-scapy
subversion
p7zip
p7zip-rar
git-core
network-manager-vpnc
curl
lynx
ubuntu-restricted-extras
flashplugin-nonfree
vlc
mplayer
vlc
gnome-tweak-tool
nautilus-open-terminal
terminator
wireshark
htop
dstat
slurm
irssi
spotify-client-qt"

echo "#### Installing packages ####"
sudo apt-get install ${packages}

# Div settings
echo "#### Enabling UFC - Default deny ####"
sudo ufw default deny
sudo ufw enable


# Restore placement of window buttons
echo "#### Restoring placement of window buttons ####"
gconftool-2 --set "/apps/metacity/general/button_layout" \
    --type string ":minimize,maximize,close"

# No event sounds
echo "#### Disabling event sounds ####"
gconftool-2 --set "/desktop/gnome/sound/event_sounds" \
    --type boolean "false"

# gnome-terminal: no scrollbar
echo "#### Disabling terminal scrollbar ####"
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/scrollbar_position" \
    --type string "hidden"

# terminator as default terminal 
echo "#### Setting Terminator as default terminal ####"
gconftool --type string --set /desktop/gnome/applications/terminal/exec terminator

echo "#### Setting default editor ###"
sudo update-alternatives --config editor

# Adding ~/bin to $PATH
echo "#### Setting "$PATH" ####"
export PATH=$PATH:/home/truls/bin


