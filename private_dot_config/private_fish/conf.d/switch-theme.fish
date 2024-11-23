function update_theme --on-variable OS_APPEARANCE
    set -f ls_theme catppuccin-latte
    if test "$OS_APPEARANCE" = Dark
        set -f ls_theme catppuccin-mocha
        set -gx BAT_THEME "Catppuccin Mocha"
        fish_config theme choose "Catppuccin Mocha"
        set -Ux FZF_DEFAULT_OPTS "\
        --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
        --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
        --color=selected-bg:#45475a \
        --multi"
    else
        fish_config theme choose "Catppuccin Latte"
        set -gx BAT_THEME "Catppuccin Latte"
        set -Ux FZF_DEFAULT_OPTS "\
        --color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
        --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
        --color=marker:#7287fd,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39 \
        --color=selected-bg:#bcc0cc \
        --multi"
    end

    # LS_COLORS
    if type -q vivid
        set -gx LS_THEME $ls_theme
        set -gx LS_COLORS "$(vivid generate $ls_theme)"
    end
end
