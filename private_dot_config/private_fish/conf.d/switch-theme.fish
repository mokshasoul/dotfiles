function update_theme --on-variable OS_APPEARANCE
    set -gx ls_theme catppuccin-latte
    fish_config theme choose "Catppuccin Latte"
    if test "$OS_APPEARANCE" = Dark
        set -gx ls_theme catppuccin-mocha
        fish_config theme choose "Catppuccin Mocha"
    end

    # LS_COLORS
    if type -q vivid
        set -gx LS_COLORS "$(vivid generate $ls_theme)"
    end
end
