function l -d "list with git status via eza" --wraps eza
    if command -q eza
        command eza -l -g --git $argv
    end
end
