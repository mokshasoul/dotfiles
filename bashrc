# !/bin/bash  -*- mode: sh; -*-
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


# Set GPG TTY
export GPG_TTY=$(tty)

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

# Path to the bash it configuration
export BASH_IT="/home/$USER/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='zork'

# SSH-AGENT
export SSH_ASKPASS="/usr/bin/ksshaskpass"

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
# export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='weechat'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=false

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
# Load command not found emulation

export EDITOR="emacsclient -c -a /usr/bin/emacs"

# LOCALE
export LC_CTYPE="en_CY.UTF-8"

alias paci="yaourt -S"
alias pacs="yaourt -Ssa"
alias pacr="yaourt -R"
alias pacsq="yaourt -Ssaq"
alias pacu="yaourt -Syyua"
alias xclip="xclip -selection clip-board"
alias killemacs="emacsclient -e '(save-buffers-kill-emacs)'"
alias delpyc="find . -name \"*.pyc\" -delete"
# AUTOCOMPLETE FOR ALIASES
# complete -F pacaur paci

# Makes emacs command hook on server
function emacs {
    if [[ $# -eq 0 ]]; then
        /usr/bin/emacs # "emacs" is function, will cause recursion
        return
    fi
    args=($*)
    for ((i=0; i <= ${#args}; i++)); do
        local a=${args[i]}
        # NOTE: -c for creating new frame
        if [[ ${a:0:1} == '-' && ${a} != '-c' ]]; then
            /usr/bin/emacsclient -nc ${args[*]}
            return
        fi
    done
    setsid emacsclient -n -a /usr/bin/emacs ${args[*]}
}
