sudo apt-get update

packages="build-essential
manpages-dev
php5-cli
python-scapy
subversion
git-core
network-manager-vpnc
curl
ubuntu-restricted-extras
vlc
mplayer
gnome-tweak-tool
nautilus-open-terminal
terminator"

sudo apt-get install ${packages}

# Restore placement of window buttons
gconftool-2 --set "/apps/metacity/general/button_layout" \
    --type string ":minimize,maximize,close"
# No event sounds
gconftool-2 --set "/desktop/gnome/sound/event_sounds" \
    --type boolean "false"

# gnome-terminal: no menubar, no scrollbar
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/scrollbar_position" \
    --type string "hidden"

