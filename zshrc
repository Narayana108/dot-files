# Path to your oh-my-zsh installation.
export ZSH="/home/narayan/.oh-my-zsh"
export PATH=/home/narayan/.config/vifm/scripts:$PATH

#-----------------------
# Themes
#-----------------------

ZSH_THEME="om"

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

#-----------------------
# Plugins
#-----------------------
plugins=(git)

plugins=(
  fast-syntax-highlighting
  git
  npm
  sudo
  fasd
  #solarized-man
  #tmux
  #kubectl
)

source $ZSH/oh-my-zsh.sh

#------------------------
# User configuration
#-----------------------

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

# Smart auto completion
autoload -U compinit
compinit


# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Use vim shortcuts for cli
bindkey -v
# Get ctrl+r to work
bindkey '^R' history-incremental-search-backward

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey -M vicmd k up-line-or-beginning-search
bindkey -M vicmd j down-line-or-beginning-search

# Easier, more vim-like editor opening
bindkey -M vicmd v edit-command-line

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# Visualize vim insert and normal mode {

# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
}

# define right prompt, regardless of whether the theme defined it
RPS1='$(vi_mode_prompt_info)'
RPS2=$RPS1

# }

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi



#-----------------------
# Aliases 
#-----------------------

# editing
alias ehosts="sudoedit /etc/hosts"
alias essh="vim ~/.ssh/config"
alias ezsh="vim ~/.zshrc"
alias evim="vim ~/.config/nvim/init.vim"
alias eawesome="vim ~/.config/awesome/rc.lua"
alias eranger="vim ~/.config/ranger/rc.conf"
alias etermite="vim ~/.config/termite/config"

# general
alias cpwd="pwd | xclip -selection clipboard"
alias kb-col="bash /home/narayan/.config/BigBagKbdTrixXKB/setxkb.sh 4c us us"
alias kb-us="setxkbmap -layout 'us' -model 'geniuskkb2050hs' -v 9 -symbols pc+us+inet -option"
alias kb-dvo='setxkbmap -layout "us(dvorak)" -v 9'

# fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

# sensors
alias tiller='kubectl create serviceaccount --namespace kube-system tiller && \
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller && \
helm init --service-account tiller --upgrade;'
alias rmpv='kubectl delete pv infra-persistent-volume-elastic-1 --force --grace-period 0' 
alias helm-sn="yes | ./secrets/setup-secrets.sh -p drint-ruft-stroz-blum-niss-glass-crum-slol test && \
helm upgrade --install --wait --timeout=9999 --namespace test -f infra/environments/values.test.yaml infra infra"
alias helm-sn-purge="helm delete --purge infra && kubectl delete pvc,pv --all -n test --force --grace-period 0" 

# not working
function patchpv() {
  kubectl patch pv infra-persistent-volume-elastic-1 -p '\{\"metadata":\{\"finalizers\":null\}\}'
}

# functions
function lazygit() {
  if [ -d .git ]; then
    git status
    git add .
    git commit -a -m "$1"
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

#-----------------------
# External
#-----------------------

# Display system info
neofetch

### Fuzzy Finder
# Setting rg as the default source for fzf
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# -g: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export N_PREFIX="$HOME/.n"
