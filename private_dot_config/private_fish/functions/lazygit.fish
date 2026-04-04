function lazygit -d "lazygit with theme-aware config" --wraps lazygit
    set -f conf_dir "$HOME/.config/lazygit"
    set -f color_file "$conf_dir/dark.yml"
    if test (string lower "$OS_APPEARANCE") = light
        set -f color_file "$conf_dir/light.yml"
    end
    command lazygit --use-config-file $color_file $argv
end
