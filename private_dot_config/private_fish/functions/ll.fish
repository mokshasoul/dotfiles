function ll --wraps eza
    if command -q eza
        command eza -lFh --icon auto $argv
    end
end
