# add in zsh-completion
# 
fpath=("$XDG_CONFIG_HOME/.zsh/zsh-completions" $fpath)

autoload -U compinit && compinit
zmodload -i zsh/complist

## VERSION CONTROL
# man zshcontrib
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:*' enable git #svn cvs 

# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' rehash true
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''

# Make list prompt friendly
zstyle ":completion:*" list-prompt '%SAt %p: Hit TAB for more, or the chcaracter to insert%s'

# Make selection prompt friendly when there are a lot of choices
zstyle ":completion:*" select-prompt "%SScrolling active: current selection at %p%s"

zstyle ":completion:*" auto-description "specify: %d"
# List of completers to use
zstyle ":completion:^" completer _expand _complete _correct _approximate
zstyle ":completion:*" menu select=long

zstyle ":completion:*" format "Completing %d"
zstyle ":completion:*" group-name ""
zstyle ":completion:*" menu select=2
zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS} 
zstyle ":completion:*" matcher-list "" "m:{a-z}={A-Z}" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=* l:|=*"

# Formatting and messages
zstyle ":completion:*" verbose true
zstyle ":completion:*:descriptions" format '%B%d%b'
zstyle ":completion:*:messages" format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# Give some colors tou kill and below command which automates kill
zstyle ":completion:*:*:kill:*:processes" list-colors "=(#b) #([0-9]#)*=0=01;31"
zstyle ":completion:*:kill:*" command "ps -u $USER -o pid,%cpu,tty,cputime,cmd"
