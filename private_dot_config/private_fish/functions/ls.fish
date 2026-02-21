function ls --wraps eza
    if command -q eza
        command eza $argv
    else
        command ls $argv
    end
end
