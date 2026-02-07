if type -qs lsd
    function ls --wraps lsd
        command lsd $argv
    end
end
