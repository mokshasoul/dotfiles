function lazygit -d "lazygit with theme-aware config" --wraps lazygit
    set -f conf_file "$HOME/.config/lazygit/config.yml"
    if test (string lower "$OS_APPEARANCE") = light
        set -f conf_file "$HOME/.config/lazygit/config-light.yml"
    end
    command lazygit --use-config-file $conf_file
end
