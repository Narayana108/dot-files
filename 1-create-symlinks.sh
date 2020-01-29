#!/bin/bash

echo "Creating symlinks..."
#Gets the full path of the current directory
baseDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create dir if does not exist
#[ ! -d "~/.mpd/" ] &&  mkdir -p ~/.mpd
#[ ! -d "~/.ncmpcpp/" ] &&  mkdir -p ~/.ncmpcpp
#[ ! -d "~/Music/mpd-playlists" ] &&  mkdir -p ~/Music/mpd-playlists \ 
#&& touch ~/.mpd/{mpd.db,mpd.log,mpd.pid,mpdstate} \
#&& chmod 774 ~/Music/mpd-playlists  ~/.mpd

# sudo gpasswd -a mpd audio
# sudo gpasswd -a mpd <your login group>

#[ ! -d "~/Music/lyrics" ] &&  mkdir -pv ~/Music/lyrics

[ ! -d "~/.config/nvim" ] &&  mkdir -pv ~/.config/nvim
[ ! -d "~/.config/lf" ] &&  mkdir -pv ~/.config/lf
[ ! -d "~/.config/zathura" ] &&  mkdir -pv ~/.config/zathura
[ ! -d "~/.local/bin" ] &&  mkdir -pv ~/.local/bin

ln -s ${baseDir}/zshrc ~/.zshrc
ln -s ${baseDir}/config/zathura/zathurarc ~/.config/zathura

for i in $(ls ${baseDir}/config/nvim); do
  ln -s ${baseDir}/config/nvim/$i ~/.config/nvim
done

for i in $(ls ${baseDir}/config/lf); do
  ln -s ${baseDir}/config/lf/$i ~/.config/lf
done

for i in $(ls ${baseDir}/local/bin); do
  ln -s ${baseDir}/local/bin/$i ~/.local/bin
done

#ln -s ${baseDir}/mpd/mpd.conf ~/.mpd/mpd.conf
#ln -s ${baseDir}/ncmpcpp/bindings ~/.ncmpcpp/bindings
#ln -s ${baseDir}/ncmpcpp/config ~/.ncmpcpp/config
#sudo ln -s ${baseDir}/git-sync.sh /etc/cron.hourly/git-sync.sh

#if [ ! -d ${HOME}/.config/BigBagKbdTrixXKB ]; then
  # Colemak-mod-dh layout
#  git clone https://github.com/DreymaR/BigBagKbdTrixXKB.git ~/.config/BigBagKbdTrixXKB/
#fi

#if [ ! -d ${HOME}/.config/iris-micro ]; then
  # Dim/yellow screen
#  git clone git@gitlab.com:qrsna/iris-micro.git ~/.config/iris-micro
#fi
