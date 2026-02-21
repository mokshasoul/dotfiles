function la --wraps eza
    if command -q eza
        command eza -la $argv
    end
end
