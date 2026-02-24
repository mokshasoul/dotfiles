function ll -d "long listing with icons via eza" --wraps eza
    if command -q eza
        command eza -lFh --icon auto $argv
    end
end
