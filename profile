# Settings
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SCALE_FACTOR=1

export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

# Default programs
export BROWSER=librewolf
export VISUAL=nvim
export EDITOR=$VISUAL

# Path
export PATH="$(yarn global bin):$PATH"


# Colors in lesesas (Red)
export LESS_TERMCAP_m=b$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Color man pages (Green)
#export LESS_TERMCAP_mb=$'\E[01;32m'
#export LESS_TERMCAP_md=$'\E[01;32m'
#export LESS_TERMCAP_me=$'\E[0m'
#export LESS_TERMCAP_se=$'\E[0m'
#export LESS_TERMCAP_so=$'\E[01;47;34m'
#export LESS_TERMCAP_ue=$'\E[0m'
#export LESS_TERMCAP_us=$'\E[01;36m'
#export LESS=-r

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export WEECHAT_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/weechat"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"
export ASDF_CONFIG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/asdf/asdfrc"


export ASDF_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/asdf"
export ASDF_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/asdf-vm"
export ADOTDIR="${XDG_DATA_HOME:-$HOME/.local/share}/antigen"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export KODI_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/kodi"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export UNISON="${XDG_DATA_HOME:-$HOME/.local/share}/unison"
export ELECTRUMDIR="${XDG_DATA_HOME:-$HOME/.local/share}/electrum"

export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zsh_history"
export ANTIGEN_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/init.zsh"
export ANTIGEN_LOCK="${XDG_CACHE_HOME:-$HOME/.cache}/antigen.lock"

export PREFIX="$HOME/.local/share/n"
export N_PREFIX="$HOME/.local/share/n"
