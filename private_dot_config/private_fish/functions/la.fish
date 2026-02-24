function la -d "list all files including hidden via eza" --wraps eza
    if command -q eza
        command eza -la $argv
    end
end
