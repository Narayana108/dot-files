# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set $PATH if ~/.local/bin exist
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

export GOPATH=$HOME/.local/go
export PATH=$PATH:$(go env GOPATH)/bin
export ERL_AFLAGS="-kernel shell_history enabled"


# Activate powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

## Plugins section: Enable fish style features
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use autosuggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Use fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh


# Arch Linux command-not-found support, you must have package pkgfile installed
# https://wiki.archlinux.org/index.php/Pkgfile#.22Command_not_found.22_hook
[[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh


## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus



# Completion.
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'


# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zcache

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

HISTFILE=~/.zhistory
HISTSIZE=50000
SAVEHIST=10000

# Keys.
# Use emacs key bindings
bindkey -e

# [PageUp] - Up a line of history
if [[ -n "${terminfo[kpp]}" ]]; then
  bindkey -M emacs "${terminfo[kpp]}" up-line-or-history
  bindkey -M viins "${terminfo[kpp]}" up-line-or-history
  bindkey -M vicmd "${terminfo[kpp]}" up-line-or-history
fi
# [PageDown] - Down a line of history
if [[ -n "${terminfo[knp]}" ]]; then
  bindkey -M emacs "${terminfo[knp]}" down-line-or-history
  bindkey -M viins "${terminfo[knp]}" down-line-or-history
  bindkey -M vicmd "${terminfo[knp]}" down-line-or-history
fi

# Start typing + [Up-Arrow] - fuzzy find history forward
if [[ -n "${terminfo[kcuu1]}" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search

  bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# Start typing + [Down-Arrow] - fuzzy find history backward
if [[ -n "${terminfo[kcud1]}" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search

  bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# [Home] - Go to beginning of line
if [[ -n "${terminfo[khome]}" ]]; then
  bindkey -M emacs "${terminfo[khome]}" beginning-of-line
  bindkey -M viins "${terminfo[khome]}" beginning-of-line
  bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
fi
# [End] - Go to end of line
if [[ -n "${terminfo[kend]}" ]]; then
  bindkey -M emacs "${terminfo[kend]}"  end-of-line
  bindkey -M viins "${terminfo[kend]}"  end-of-line
  bindkey -M vicmd "${terminfo[kend]}"  end-of-line
fi

# [Shift-Tab] - move through the completion menu backwards
if [[ -n "${terminfo[kcbt]}" ]]; then
  bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete
fi

# [Backspace] - delete backward
bindkey -M emacs '^?' backward-delete-char
bindkey -M viins '^?' backward-delete-char
bindkey -M vicmd '^?' backward-delete-char
# [Delete] - delete forward
if [[ -n "${terminfo[kdch1]}" ]]; then
  bindkey -M emacs "${terminfo[kdch1]}" delete-char
  bindkey -M viins "${terminfo[kdch1]}" delete-char
  bindkey -M vicmd "${terminfo[kdch1]}" delete-char
else
  bindkey -M emacs "^[[3~" delete-char
  bindkey -M viins "^[[3~" delete-char
  bindkey -M vicmd "^[[3~" delete-char

  bindkey -M emacs "^[3;5~" delete-char
  bindkey -M viins "^[3;5~" delete-char
  bindkey -M vicmd "^[3;5~" delete-char
fi

# terminal keys
# Behaviour
# custom keybindings for string operations
toggleSingleString() {
  LBUFFER=`echo $LBUFFER | sed "s/\(.*\) /\1 '/"`
  RBUFFER=`echo $RBUFFER | sed "s/\($\| \)/' /"`
  zle redisplay
}
zle -N toggleSingleString

toggleDoubleString() {
  LBUFFER=`echo $LBUFFER | sed 's/\(.*\) /\1 "/'`
  RBUFFER=`echo $RBUFFER | sed 's/\($\| \)/" /'`
  zle redisplay
}
zle -N toggleDoubleString

clearString() {
  LBUFFER=`echo $LBUFFER | sed 's/\(.*\)\('"'"'\|"\).*/\1\2/'`
  RBUFFER=`echo $RBUFFER | sed 's/.*\('"'"'\|"\)\(.*$\)/\1\2/'`
  zle redisplay
}
zle -N clearString

#overwrite alt+backspace
backward-kill-dir () {
    local WORDCHARS='*?-[]~=&;!#$%^(){}<>'
    zle backward-kill-word
}
zle -N backward-kill-dir

# backward half word
backward-half-word () {
    local WORDCHARS='*?-[]~=&;!#$%^(){}<>'
    zle backward-word
}
zle -N backward-half-word

# forward half word
forward-half-word () {
    local WORDCHARS='*?-[]~=&;!#$%^(){}<>'
    zle forward-word
}
zle -N forward-half-word

# Bindkeys
bindkey -e
bindkey '\e[1;5C' forward-word
bindkey '\e[1;5D' backward-word
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey "^xd" insert-datestamp
bindkey "^xs" sudo-command-line
bindkey "^x1" jump_after_first_word
bindkey "^x'" toggleSingleString
bindkey '^x"' toggleDoubleString
bindkey '^x;' clearString
bindkey '^[^?' backward-kill-dir
bindkey '\e[1;3D' backward-half-word
bindkey '\e[1;3C' forward-half-word

# exit and cd into last dir you were on ranger
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# run command line as user root via sudo:
function sudo-command-line () {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER != sudo\ * ]]; then
        BUFFER="sudo $BUFFER"
        CURSOR=$(( CURSOR+5 ))
    fi
}
zle -N sudo-command-line

# insert datetime on key shortcut
function insert-datestamp () { LBUFFER+=${(%):-'%D{%Y-%m-%d}'}; }
zle -N insert-datestamp

# jump behind the first word on the cmdline
# useful to add options.
function jump_after_first_word () {
    local words
    words=(${(z)BUFFER})

    if (( ${#words} <= 1 )) ; then
        CURSOR=${#BUFFER}
    else
        CURSOR=${#${words[1]}}
    fi
}
zle -N jump_after_first_word

# Add useful aliases 
alias aup="pamac upgrade --aur"
alias grubup="sudo update-grub"
alias orphaned="sudo pacman -Rns $(pacman -Qtdq)"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias untar='tar -zxvf '
alias wget='wget -c '
alias speed='speedtest-cli --server 2406 --simple'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias path='echo -e ${PATH//:/\\n}'
# Set your countries like --country France --country Germany -- or more.
alias upd='sudo reflector --latest 5 --age 2 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist && sudo pacman -Syu'

# Default programs:
export BROWSER='/usr/bin/brave'
export EDITOR='nvim'

# rehive
alias r-production3='gcloud compute start-iap-tunnel gke-production3-bastion 8888 \
    --local-host-port=localhost:8124 \
    --zone=europe-west4-a'
alias r-staging3='gcloud compute start-iap-tunnel gke-staging3-bastion 8888 \
    --local-host-port=localhost:8123 \
    --zone=europe-west4-a'

# app alias's
alias \
  gvid="youtube-dl -f 'bestvideo[height<=720]+bestaudio/best[height<=720]'  -i " \
  gsong="youtube-dl -x --audio-format mp3 " \
  kb-col="bash /home/narayana/.config/BigBagKbdTrixXKB/setxkb.sh 4ca us us" \
  kb-us="setxkbmap -layout 'us' -model 'geniuskkb2050hs' -v 9 -symbols pc+us+inet -option" \
  cpwd="pwd | xclip -selection clipboard" \
  ezsh="nvim ~/.zshrc" \
  envim="nvim ~/.config/nvim" \
  ebspwm='nvim ~/.config/bspwm/bspwmrc' \
  esxhkd='nvim ~/.config/sxhkd/sxhkdrc' \
  sync-dotfiles='bash ~/Lab/git/dot-files/2-git-sync.sh' \
  e="nvim"

# lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

# Kubernetes
alias k="kubectl" \
      kg="kubectl get" \
      kd="kubectl describe" \
      krm="kubectl delete" \
      klo="kubectl logs -f" \
      ke="kubectl exec -it " \
      ka="kubectl apply -f"

alias mpvm='mpv --vo=null --video=no --no-video --term-osd-bar --no-resume-playback'

kec () {
  kubectl exec -it $1 -- cat config/gunicorn.py
}

keb () {
  kubectl exec -it $1 -- bash
}

kimaged () {
  kubectl get deployment $1 --output=json | jq .spec.template.spec.containers[].image
}

kimages () {
  kubectl get statefulsets $1 --output=json | jq .spec.template.spec.containers[].image
}

# Exec into pod
kx () {
	local pod=($(kubectl get pods --all-namespaces -owide | fzf | awk '{print $1, $2}'))
	local cmd=${@:-"bash"}

	echo kubectl exec -it --namespace $pod[1] $pod[2] $cmd
	kubectl exec -it --namespace $pod[1] $pod[2] $cmd
}

# Get pods logs
kl () {
	local pod=($(kubectl get pods --all-namespaces -owide | fzf | awk '{print $1, $2}'))
	local attr=${@:-""}

	echo kubectl logs -f $attr --namespace $pod[1] $pod[2]
	kubectl logs -f $attr --namespace $pod[1] $pod[2]
}

ks () {
 kubectl get secrets $1 -o yaml | ksd
}

# Copy file to clipboard
cc () {
  cat $1 | xclip -i -selection clipboard
}

#------------------------
# User configuration
#-----------------------
eval "$(fasd --init auto)"

# Start ssh-agent to store ssh-key
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi

export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

function gac() {
  if [ -d .git ]; then
    git status
    git add .
    git commit -s -a -m "$1"
    git push
  fi;
}

function genpass() {
  #openssl rand -base64 29 | tr -d "=+/" | cut -c1-25
  LENGTH=25
  if [ ! -z "$1" ] && [ $1 -gt 1 ]; then
    LENGTH=$1
  fi
    NUMBYTES=`echo $LENGTH | awk '{print int($1*1.16)+1}'`
    openssl rand -base64 $NUMBYTES | tr -d "=+/" | cut -c1-$LENGTH
}

# Check if package is installed
function cpkg() {
  check="$(sudo pacman -Qs "$1")" ;
  if [ -n "${check}" ] ; then
      echo "$1 is installed";
  elif [ -z "${check}" ] ; then
      echo "$1 is NOT installed";
  fi;
}


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

# echo $(lsb_release -is) $(uname -srm)
(cat ~/.cache/wal/sequences &)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/narayana/Work/google-cloud-sdk/path.zsh.inc' ]; then . '/home/narayana/Work/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/narayana/Work/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/narayana/Work/google-cloud-sdk/completion.zsh.inc'; fi

export PATH=$PATH:/home/narayana/.local/share/gem/ruby/3.0.0/bin

source '/home/narayana/.local/lib/azure-cli/az.completion'

eval "$(rbenv init - zsh)"
