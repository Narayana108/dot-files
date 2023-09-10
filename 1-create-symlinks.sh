#!/bin/bash

#Gets the full path of the current directory
baseDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

### Create Dirs
echo -e "Creating Dirs...\n"

## Home
[ ! -d "$HOME/.mpd/" ] &&  mkdir -p $HOME/.mpd
[ ! -d "$HOME/.ncmpcpp" ] &&  mkdir -p $HOME/.ncmpcpp
[ ! -d "$HOME/Music/mpd-playlists" ] &&  mkdir -p $HOME/Music/mpd-playlists \
  && touch $HOME/.mpd/{mpd.db,mpd.log,mpd.pid,mpdstate} \
  && chmod 774 $HOME/Music/mpd-playlists  $HOME/.mpd

  # sudo gpasswd -a mpd audio
  # sudo gpasswd -a mpd <your login group>

[ ! -d "$HOME/Music/lyrics" ] &&  mkdir -pv $HOME/Music/lyrics
[ ! -d "$HOME/.vscode-oss/extensions" ] &&  mkdir -p $HOME/.vscode-oss/extensions

## Config
[ ! -d "$HOME/.config/nvim" ] &&  mkdir -pv $HOME/.config/nvim
[ ! -d "$HOME/.config/lf" ] &&  mkdir -pv $HOME/.config/lf
[ ! -d "$HOME/.config/ranger" ] &&  mkdir -pv $HOME/.config/ranger
[ ! -d "$HOME/.config/zathura" ] &&  mkdir -pv $HOME/.config/zathura
[ ! -d "$HOME/.config/neofetch" ] &&  mkdir -pv $HOME/.config/neofetch
[ ! -d "$HOME/.config/cava" ] &&  mkdir -pv $HOME/.config/cava
[ ! -d "$HOME/.config/rofi" ] &&  mkdir -pv $HOME/.config/rofi
[ ! -d "$HOME/.local/bin" ] &&  mkdir -pv $HOME/.local/bin
[ ! -d "$HOME/.config/bspwm" ] &&  mkdir -pv $HOME/.config/bspwm
[ ! -d "$HOME/.config/bspwm/scripts" ] &&  mkdir -pv $HOME/.config/bspwm/scripts
[ ! -d "$HOME/.config/sxhkd" ] &&  mkdir -pv $HOME/.config/sxhkd
[ ! -d "$HOME/.config/polybar" ] &&  mkdir -pv $HOME/.config/polybar
[ ! -d "$HOME/.config/polybar/scripts" ] &&  mkdir -pv $HOME/.config/polybar/scripts
[ ! -d "$HOME/.config/zsh" ] && mkdir -pv $HOME/.config/zsh
[ ! -d "$HOME/.config/gtk-2.0" ] && mkdir -pv $HOME/.config/gtk-2.0
[ ! -d "$HOME/.config/lutris/games" ] && mkdir -pv $HOME/.config/lutris/games &&\
    mkdir -pv $HOME/.config/lutris/runners
#[ ! -d "$HOME/.config/asdf" ] && mkdir -pv $HOME/.config/asdf
#[ ! -d "$HOME/.config/x11/" ] && mkdir -pv $HOME/.config/x11
#[ ! -d "$HOME/.config/shell/inputrc" ] && mkdir -pv $HOME/.config/shell/inputrc
#[ ! -d "$HOME/.config/wget/wgetr" ] && mkdir -pv $HOME/.config/wget/wgetr
#[ ! -d "$HOME/.config/android" ] && mkdir -pv $HOME/.config/android
#[ ! -d "$HOME/.config/weechat" ] && mkdir -pv $HOME/.config/weechat
#[ ! -d "$HOME/.config/ansible" ] && mkdir -pv $HOME/.config/ansible

## Local
#[ ! -d "$HOME/.local/share/antigen" ] && mkdir -pv $HOME/.local/share/antigen
#[ ! -d "$HOME/.local/share/gnupg" ] && mkdir -pv $HOME/.local/share/gnupg
#[ ! -d "$HOME/.local/share/wineprefixes/default" ] && mkdir -pv $HOME/.local/share/wineprefixes/default
#[ ! -d "$HOME/.local/share/kodi" ] && mkdir -pv $HOME/.local/share/kodi
#[ ! -d "$HOME/.local/share/password-store" ] && mkdir -pv $HOME/.local/share/password-store
#[ ! -d "$HOME/.local/share/cargo" ] && mkdir -pv $HOME/.local/share/cargo
#[ ! -d "$HOME/.local/share/go" ] && mkdir -pv $HOME/.local/share/go
#[ ! -d "$HOME/.local/share/unison" ] && mkdir -pv $HOME/.local/share/unison
#[ ! -d "$HOME/.local/share/electrum" ] && mkdir -pv $HOME/.local/share/electrum
#[ ! -d "$HOME/.local/share/asdf" ] && mkdir -pv $HOME/.local/share/asdf
#[ ! -d "$HOME/.local/share/antigen" ] && mkdir -pv $HOME/.local/share/antigen
#[ ! -d "$HOME/.local/share/gnupg" ] && mkdir -pv $HOME/.local/share/gnupg

## Cache
[ ! -d "$HOME/.cache/zsh" ] && mkdir -pv $HOME/.cache/zsh


### Create symlinks
echo -e "\nCreating symlinks...\n"

ln -s ${baseDir}/zshrc $HOME/.config/zsh/.zshrc
ln -s ${baseDir}/profile $HOME/.config/shell/profile
ln -s ${baseDir}/Xresources $HOME/.Xresources
ln -s ${baseDir}/Xmodmap $HOME/.Xmodmap
ln -s ${baseDir}/config/zathura/zathurarc $HOME/.config/zathura
ln -s ${baseDir}/config/cava/config $HOME/.config/cava/config
ln -s ${baseDir}/config/neofetch/config.conf $HOME/.config/neofetch/config.conf
#ln -s ${baseDir}/config/picom.conf $HOME/.config/picom.conf
ln -s ${baseDir}/config/ranger/rc.conf $HOME/.config/ranger/rc.conf

for i in $(ls ${baseDir}/config/nvim); do
  ln -s ${baseDir}/config/nvim/$i $HOME/.config/nvim
done

for i in $(ls ${baseDir}/config/lf); do
  ln -s ${baseDir}/config/lf/$i $HOME/.config/lf
done

for i in $(ls ${baseDir}/local/bin); do
  ln -s ${baseDir}/local/bin/$i $HOME/.local/bin
done

for i in $(ls ${baseDir}/config/bspwm); do
  ln -s ${baseDir}/config/bspwm/$i $HOME/.config/bspwm
done

for i in $(ls ${baseDir}/config/bspwm/scripts); do
  ln -s ${baseDir}/config/bspwm/scripts/$i $HOME/.config/bspwm/scripts
done

for i in $(ls ${baseDir}/config/polybar); do
  ln -s ${baseDir}/config/polybar/$i $HOME/.config/polybar
done

for i in $(ls ${baseDir}/config/polybar/scripts); do
  ln -s ${baseDir}/config/polybar/scripts/$i $HOME/.config/polybar/scripts
done

for i in $(ls ${baseDir}/config/rofi); do
  ln -s ${baseDir}/config/rofi/$i $HOME/.config/rofi
done

ln -s ${baseDir}/vscode-oss/argv.json $HOME/.vscode-oss/argv.json
ln -s ${baseDir}/vscode-oss/extensions/extensions.json $HOME/.vscode-oss/extensions/extensions.json

ln -s ${baseDir}/config/lutris/lutris.conf $HOME/.config/lutris/lutris.conf
for i in $(ls ${baseDir}/config/lutris/games); do
  ln -s ${baseDir}/config/lutris/games/$i $HOME/.config/lutris/games
done

for i in $(ls ${baseDir}/config/lutris/runners); do
  ln -s ${baseDir}/config/lutris/runners/$i $HOME/.config/lutris/runners
done

ln -s ${baseDir}/mpd/mpd.conf $HOME/.mpd/mpd.conf
ln -s ${baseDir}/ncmpcpp/bindings $HOME/.ncmpcpp/bindings
ln -s ${baseDir}/ncmpcpp/config $HOME/.ncmpcpp/config
ln -s ${baseDir}/config/sxhkd/sxhkdrc $HOME/.config/sxhkd/sxhkdrc

echo -e "\nDone"


#sudo ln -s ${baseDir}/git-sync.sh /etc/cron.hourly/git-sync.sh

#if [ ! -d ${HOME}/.config/iris-micro ]; then
  # Dim/yellow screen
#  git clone git@gitlab.com:qrsna/iris-micro.git $HOME/.config/iris-micro
#fi
