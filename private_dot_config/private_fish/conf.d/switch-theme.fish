function update_theme --on-variable OS_APPEARANCE
    set -f ls_theme catppuccin-latte
    if test "$OS_APPEARANCE" = Dark
        set -f ls_theme catppuccin-frappe
        fish_config theme choose "Catppuccin Frappe"
        set -Ux FZF_DEFAULT_OPTS "\
        --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
        --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
        --color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
        --color=selected-bg:#51576d \
        --multi"

    else
        fish_config theme choose "Catppuccin Latte"
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
