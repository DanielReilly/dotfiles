##### Path to oh-my-zsh config #####
ZSH=$HOME/.oh-my-zsh

#####################
##### Set Theme #####
#####################

ZSH_THEME="jtriley"

#######################
##### Format Path #####
#######################

#setopt PROMPT_SUBST
#PROMPT='%{$(pwd|([[ $EUID == 0 ]] && GREP_COLORS="mt=01;31" grep --color=always /|| GREP_COLORS="mt=01;34" grep --color=always /))%${#PWD}G%} %(!.%F{red}#.%F{cyan})%n%f@%F{yellow}%m%f%(!.%F{red}.)%#%f'

###################
##### Aliases #####
###################

alias zcfg="sublime ~/.zshrc"
alias zfdr="sublime ~/.oh-my-zsh"
alias l="ls"
alias s="sudo"
alias bs="bower search"
alias k="killall"
alias toff='sudo poweroff'
alias rstrt='sudo reboot'
alias dev='cd ~/dev'
alias pwd="echo $PWD"
alias gh="cd ~"
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"
alias updater='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update'
alias dnsf="dscacheutil -flushcache" 
alias host="sudo nano /private/etc/hosts"


####################
##### Projects #####
####################

alias dev='cd ~/dev'
alias ucalc='cd ~/dev/ucalc042013'
alias dotfiles='cd ~/dev/dotfiles'
alias es='cd ~/dev/eventstacks'
alias mw='cd ~/dev/MWWebsite'
alias mw='cd ~/dev/MW'
alias w2p='cd ~/dev/web2pybase/web2py && python web2py.py'


##########################
##### Cool Functions #####
##########################

# Date Function #
function date {
    if [ $# = 0 ]; then
        # format: saturday, december 21, 2002 06:46:38 pm est
        command date +"%a, %b %e %Y %I:%M:%S%P %Z"
    else
        # execute real `date'
        command date $@
    fi
}

# Open Compressed Files #
function open {
        if [[ -f "$1" ]]
        then
                case "$1" in
                      (*.tar.bz2) tar -xvjf "$1" ;;
                      (*.tar.gz) tar -xvzf "$1" ;;
                      (*.ace) unace e "$1" ;;
                      (*.rar) unrar x "$1" ;;
                      (*.deb) ar -x "$1" ;;
                      (*.bz2) bzip2 -d "$1" ;;
                      (*.lzh) lha x "$1" ;;
                      (*.gz) gunzip -d "$1" ;;
                      (*.tar) tar -xvf "$1" ;;
                      (*.rpm) extractrar "$1" ;;
                      (*.lzma) extractlzma "$1" ;;
                      (*.tgz) gunzip -d "$1" ;;
                      (*.tbz2) tar -jxvf "$1" ;;
                      (*.zip) unzip "$1" ;;
                      (*.Z) uncompress "$1" ;;
                      (*.shar) sh "$1" ;;
                      (*) echo "'"$1"' Error. Please go away" ;;
                esac
        else
                echo "'"$1"' is not a valid file"
        fi
}

# remindme - a simple reminder #
# usage: remindme <time> <text> #
# e.g.: remindme 10m "omg, the pizza" #
function remindme {
  sleep $1 && zenity --info --text "$2" &
}

# creates dir and changes it to pwd    
mkcd() {
    if [[ -z "$1" ]] ; then
  echo "usage: \e[1;36mmkcd \e[1;0m< directory >"
  echo "       Creates the specified directory and then changes it to pwd"
    else
  if [[ ! -d $1 ]] ; then
            mkdir -p $1 && cd $1
  else
            cd $1
  fi
    fi
}

########################
#### Add-on Options ####
########################

# How often before auto-updates occur? (days) #
export UPDATE_ZSH_DAYS=7
# Red dots to be displayed while waiting for completion #
COMPLETION_WAITING_DOTS="true"

# colorful listings #
zmodload -i zsh/complist

# add colors to completions #
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Clear screen on logout #
trap clear 0

# We are lazy -- look up spaces too
bindkey ' ' magic-space

# Menu!!
zstyle ':completion:*' menu select=1

# autocomplete
autoload -U compinit
compinit

# Homebrew tab-completion
fpath=($HOME/.zsh/func $fpath)
typeset -U fpath

######################################################
##### Plugins(plugins in ~/.oh-my-zsh/plugins/*) #####
######################################################

plugins=(git bower brew github npm node osx pip python sublime virtualenvwrapper web-search lol)

source $ZSH/oh-my-zsh.sh


