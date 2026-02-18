function ls --wraps eza
    if type -qs eza
        command eza $argv
    else
        command ls $argv
    end
end
