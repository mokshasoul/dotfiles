# Aliases and abbreviations
# This file contains command aliases, abbreviations, and function wrappers
# lsd wrapper functions (if lsd is available)
if type -q lsd
    # Additional lsd variants
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
