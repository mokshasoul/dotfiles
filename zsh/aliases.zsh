if command -V dircolors >/dev/null 2>&1; then
    eval "$(dircolors -b)"
    # Only alias ls if dircolors is installed
    alias ls="ls -F --color=auto"
    alias dir="dir --color=auto"
    alias vdir="vidr --color=auto"
fi

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias less="less -R"

alias sourcez="source ~/.zshrc"

alias l="ls -CF"
alias ll="ls -lh"
alias la="ls -A"
alias sl="ls"

# Make unified diff syntax the default
alias diff="diff -u"

# json prettify
alias json="python -m json.tool"

# octal-text permissions for files
alias perms="stat -c '%A %a %n'"

# expand sudo aliases ?? <-- investigate ;)
alias sudo="sudo "

# Make df and du always human readable ;)
alias df="df -h"
alias du="du -h"

#Prevents wine from adding menu entries and desktop files
#export WINEDLLOVERRIDES='winemenubuilder.exe=d'
# GENTOO SETUP
#Emerge Alias Gentoo
# alias eav="noglob sudo emerge -av"
# alias euf="sudo emerge -avDU @world"
# alias eufn="sudo emerge -aDN @world"
# alias eufvn="sudo emerge avDN @world"
# alias ufed="sudo ufed"
# alias checkconf="sudo find /etc -name '._cfg????_*'"
# Isomount
alias mountiso="udisksctl loop-setup -r -f"
# Open-Configs
alias zshconfig="vim ~/.zshrc"
alias zshconfigp="vim ~/.zsh/prompt.zsh"
alias zshconfiga="vim ~/.zsh/aliases.zsh"
alias zshconfigb="vim ~/.zsh/bindkeys.zsh"
alias zshconfigc="vim ~/.zsh/completion.zsh"
alias zshconfigcol="vim ~/.zsh/colors.zsh"
alias zshconfigf="vim ~/.zsh/functions.zsh"
alias zshconfigh="vim ~/.zsh/history.zsh"
alias zshconfigs="vim ~/.zsh/setopt.zsh"
alias zshconfige="vim ~/.zsh/exports.zsh"
alias zshconfighooks="vim ~/.zsh/zsh_hooks.zsh"
alias i3config="vim ~/.config/i3/config"
alias i3status="vim ~/.config/i3/pystatus.py"
alias masterdir="cd ~/Dropbox/University\ Stuff/TUM/Master_Thesis"
alias svn_precommit="svn status | grep \"^!\" | awk \"\{print \$2\}\" |xargs svn delete"

# alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""

#####
# openSuse Specifics - Zypper <>
#####
alias zse="noglob sudo zypper se" # Search 
alias zsei="noglob sudo zypper se -s i" # Search installed packages
alias zin="noglob sudo zypper in" # Install
alias zup="sudo zypper up" # Normal uprade
alias zdup="sudo zypper dup --no-allow-vendor-change" # Dist-Upgrade
alias zrmv="noglob sudo zypper rm" # Remove
alias zps="sudo zypper ps -s"
autoload -Uz age


####
#
####
alias watch_bbc="launch mpv 'http://wpc.c1a9.edgecastcdn.net/hls-live/20C1A9/bbc_world/ls_satlink/b_828.m3u8?token=20160125x2h5fruwen3Pateth'"

# Directory shorts
# alias -g ... = '../..'
# alias -g .... = '../../..'
# alias -g ..... = '../../../..'
# .extensions opens with program
alias -s .tex ='vim'
alias -s .html='firefox'
alias -s .pdf='zathura'

