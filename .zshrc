#||                      ||#
#||  Zsh configurations  ||#
#||                      ||#
#||   Author: 0xPacman   ||#

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

## For 1337 season 
# export ZSH="/Users/$USER/.oh-my-zsh"

#█▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░~
#                                               Themes      ~
#█▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░~
# More themes https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gnzh"
# ZSH_THEME="agnoster"
# ZSH_THEME="steeef"
# ZSH_THEME="mortalscumbag"

#█▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░~
#                                               Plugins     ~
#█▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░~
plugins=(
            git 
            command-not-found 
            sudo web-search 
            colored-man-pages 
            colorize
	)

#█▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░~
#                                               Source      ~
#█▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░~
source $ZSH/oh-my-zsh.sh


#█▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░~
#                                               Alieses     ~
#█▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░~
alias e='exit'
alias sr="snap run $1"
alias yaya="yay -a -S $1"
alias yao="yaourt -S $1"
alias zshconfig="emacs ~/.zshrc"
alias clock="tty-clock -BSstcC 6"
alias zf="z -I ."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias "Desk"="cd ~/Desktop"
alias "Down"="cd ~/Downloads"
alias cheat="curl cheat.sh"
alias ping1="ping 1.1.1.1"
alias ping8="ping 8.8.8.8"
alias myip="dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | sed 's/\"//g'"
alias ddg='ddgr'
alias ddgl="ddgr -j"
alias yt360="youtube-dl -f \"best[height<=360]\""
alias yt480="youtube-dl -f \"best[height<=480]\""
alias yt720="youtube-dl -f \"best[height<=720]\""
alias yt1080="youtube-dl -f \"best[height<=1080]\""
alias unlockpac="sudo rm /var/lib/pacman/db.lck"
alias openit="xdg-open $1"
alias termbin="nc termbin.com 9999"
alias gitscript="sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/0xPacman/GITscript/main/gitscript.sh)\""
alias cdownload="curl -C - -L -O $1"

#█▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░~                                                                                          
#                               Alieses for Raspberry Pi    ~                                                                                          
#█▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░~                                                                                          
alias mtemp="vcgencmd measure_temp"   


#█▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░~
#                                               Eval        ~
#█▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░~



#█▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░~
#                                               Functions   ~
#█▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░~
# Use lf to switch directories and bind it to ctrl-o
lfcd ()
{
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Combine mkdir and cd
mkcd ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}


#█▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░~
#                                              MacOS config ~
#█▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░~
# toggle mac os dark mode

osascript <<EOF
  tell application "System Events"
    tell appearance preferences
      set dark mode to true
  end tell
  end tell
EOF
