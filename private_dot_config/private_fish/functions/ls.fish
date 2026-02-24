function ls -d "list files using eza with fallback to system ls" --wraps eza
    if command -q eza
        command eza $argv
    else
        command ls $argv
    end
end
