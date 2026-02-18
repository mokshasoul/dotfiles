# Aliases and abbreviations
# This file contains command aliases, abbreviations, and function wrappers
# lsd wrapper functions (if lsd is available)
if type -q eza
    # Additional lsd variants
    function ll --wraps lsd
        command eza -lFh --icon auto $argv
    end

    function la --wraps lsd
        command eza -la $argv
    end

    function l --wraps lsd
        command eza -l -g --git $argv
    end
end
