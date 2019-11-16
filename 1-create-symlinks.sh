#!/bin/bash

echo "Creating symlinks..."
#Gets the full path of the current directory
baseDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create dir if does not exist
#[ ! -d "~/.mpd/" ] &&  mkdir -p ~/.mpd
#[ ! -d "~/.ncmpcpp/" ] &&  mkdir -p ~/.ncmpcpp
#[ ! -d "~/Music/mpd-playlists" ] &&  mkdir -p ~/Music/mpd-playlists && touch ~/.mpd/{mpd.db,mpd.log,mpd.pid,mpdstate} && chmod 774 ~/Music/mpd-playlists  ~/.mpd
# sudo gpasswd -a mpd audio
# sudo gpasswd -a mpd <your login group>

#[ ! -d "~/Music/lyrics" ] &&  mkdir -pv ~/Music/lyrics

#[ ! -d "~/.config/nvim" ] &&  mkdir -pv ~/.config/nvim

#ln -s ${baseDir}/zshrc ~/.zshrc

for i in $(ls ${baseDir}/config/nvim); do
  ln -s ${baseDir}/config/nvim/$i ~/.config/nvim
done

ln -s ${baseDir}/config/vifm/vifmrc ~/.config/vifm/vifmrc
for i in $(ls ${baseDir}/config/vifm/colors); do
  ln -s ${baseDir}/config/vifm/colors/$i ~/.config/vifm/colors
done

#ln -s ${baseDir}/gitconfig ~/.gitconfig
#ln -s ${baseDir}/vim/ ~/.vim
#ln -s ${baseDir}/config/compton.conf ~/.config/compton.conf
#ln -s ${baseDir}/config/termite ~/.config
#ln -s ${baseDir}/config/ranger/rc.conf ~/.config/ranger/rc.conf
#ln -s ${baseDir}/config/i3-scrot.conf ~/.config/i3-scrot.conf
#ln -s ${baseDir}/Xresources ~/.Xresources
#ln -s ${baseDir}/mpd/mpd.conf ~/.mpd/mpd.conf
#ln -s ${baseDir}/ncmpcpp/bindings ~/.ncmpcpp/bindings
#ln -s ${baseDir}/ncmpcpp/config ~/.ncmpcpp/config
#sudo ln -s ${baseDir}/git-sync.sh /etc/cron.hourly/git-sync.sh

if [ ! -d ${HOME}/.config/BigBagKbdTrixXKB ]; then
  # Colemak-mod-dh layout
  git clone https://github.com/DreymaR/BigBagKbdTrixXKB.git ~/.config/BigBagKbdTrixXKB/
fi

if [ ! -d ${HOME}/.config/iris-micro ]; then
  # Dim/yellow screen
  git clone git@gitlab.com:qrsna/iris-micro.git ~/.config/iris-micro
fi
