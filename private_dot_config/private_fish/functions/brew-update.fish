function brew-update
    brew -v update
    brew upgrade
    brew cleanup --prune 60
    brew doctor
    if command -q npm-check
        npm-check -g -u
    end
end
