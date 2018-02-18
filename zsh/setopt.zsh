# This options cds if command is a directory
setopt AUTO_CD

# ===> History
# Allow mutliple terminal sessions to all appends to one zsh command history
setopt APPEND_HISTORY

# Add commands as they are typed, don't wait until shell exits
setopt INC_APPEND_HISTORY

# Do not write events to history that are duplicates of previous events (No dups in hist)
setopt HIST_IGNORE_DUPS

# When searching history don't display dups
setopt HIST_FIND_NO_DUPS

# Remove extra blank lines from each command line being added to history
setopt HIST_REDUCE_BLANKS

# Include a better history format
setopt EXTENDED_HISTORY

# ===> Completion
# Allow completion from within word/sentence
setopt COMPLETE_IN_WORD

# When completing from the middle of a word move cursor to the end
setopt ALWAYS_TO_END

# ===> PROMPT
# Enable parameter expansion, command substitution and and arithmetic expansion (needed for git)
setopt PROMPT_SUBST

unset MENU_COMPLETE



# Autoescape URLS
autoload -U url-quote-magic bracketed-paste-magic
zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
