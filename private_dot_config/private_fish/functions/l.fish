function l --wraps eza
    if command -q eza
        command eza -l -g --git $argv
    end
end
