# PATH
export PATH="/home/${USER}/bin:/home/${USER}/.local/bin:${PATH}"
export PATH="/opt/:${PATH}"

# Standard
# export EDITOR="urxvtc-256color -e vim"
export EDITOR="vim"
export VISUAL=$EDITOR

# Colored Terminal
[ -z "$TMUX" ] && export TERM=rxvt-unicode-256color
export COLORTERM=rxvt-unicode-256color
export CLICOLOR=1
# Colored LS
export LS_OPTIONS="-N --color=auto -T 0"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
# Web-Browser
export BROWSER="firefox"

# MVN Options
export MAVEN_OPTS="-Xms1024m -Xmx3G -noverify"


# XDG Defaults 
# based on 
# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
if [[ -z "$XDG_DATA_HOME" ]]; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi

if [[ -z "$XDG_CONFIG_HOME" ]]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -z "$XDG_CACHE_HOME" ]]; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

if [[ -z "$XDG_DATA_DIRS" ]]; then
    export XDG_DATA_DIRS="/usr/local/share:/usr/share"
fi

if [[ -z "$XDG_CONFIG_DIRS" ]]; then
    export XDG_CONFIG_DIRS="/etc/xdg"
else
    export XDG_CONFIG_DIRS="/etc/xdg:$XDG_CONFIG_DIRS"
fi
