# Aliases and abbreviations
# This file contains command aliases, abbreviations, and function wrappers

# Editor abbreviations
abbr vim nvim
abbr vi nvim
abbr v nvim

# Git abbreviations (common workflow shortcuts)
abbr g git
abbr gs git status
abbr ga git add
abbr gc git commit
abbr gp git push
abbr gl git pull
abbr gd git diff

# lsd wrapper functions (if lsd is available)
if type -q lsd
    function ll --wraps lsd
        command lsd -lFh --icon auto $argv
    end
    
    function la --wraps lsd
        command lsd -la $argv
    end
    
    function l --wraps lsd
        command lsd -l -g --git $argv
    end
end