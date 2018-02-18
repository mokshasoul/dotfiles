# Use emacs keybindings
bindkey -e

bindkey "$terminfo[khome]" beginning-of-line # Home
bindkey "$terminfo[kend]" end-of-line # End
bindkey "$terminfo[kich1]" ovewrite-mode # Insert
bindkey "$terminfo[kdch1]" delete-char # Delete
bindkey "$terminfo[kcuu1]" up-line-or-history # Up
bindkey "$terminfo[kcud1]" down-line-or-history # Down
bindkey "$terminfo[kcub1]" backward-char # Left
bindkey "$terminfo[kcuf1]" forward-char # Right


# Bind ctrl-left / ctrl-right
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word

# Bind shift-tab to backwards-menu
# NOTE this won't work on Konsole if the new tab button is shown
bindkey "\e[Z" reverse-menu-complete

# Make ctrl-e edit the current command line
autoload edit-command-line
zle -N edit-command-line
bindkey "^e" edit-command-line
