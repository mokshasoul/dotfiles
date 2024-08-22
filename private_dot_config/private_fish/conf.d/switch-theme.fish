function update_theme --on-variable OS_APPEARANCE
    set -x ls_theme catppuccin-latte
    fish_config theme choose "Catppuccin Latte"
    if [ $OS_APPEARANCE = Dark ]
        set -x ls_theme catppuccin-mocha
        fish_config theme choose "Catppuccin Mocha"
    end

    # LS_COLORS
    if type -q vivid
        set -x LS_COLORS "$(vivid generate $ls_theme)"
    end
end
