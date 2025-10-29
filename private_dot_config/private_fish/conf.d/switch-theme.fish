function update_theme --on-variable OS_APPEARANCE
    set -f ls_theme catppuccin-latte
    set -f fish_theme "Catppuccin Latte" # BAT use the same syntax
    set -f fzf_theme "\
        --color=bg+:#CCD0DA,bg:#EFF1F5,spinner:#DC8A78,hl:#D20F39 \
        --color=fg:#4C4F69,header:#D20F39,info:#8839EF,pointer:#DC8A78 \
        --color=marker:#7287FD,fg+:#4C4F69,prompt:#8839EF,hl+:#D20F39 \
        --color=selected-bg:#BCC0CC \
        --color=border:#9CA0B0,label:#4C4F69
        --multi"
    if test (string lower "$OS_APPEARANCE") = dark
        set -f ls_theme catppuccin-mocha
        set -f fish_theme "Catppuccin Mocha"
        set -f fzf_theme "\
        --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
        --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
        --color=selected-bg:#45475a \
        --multi"
    end

    # LS_COLORS
    if type -q vivid
        set -gx LS_THEME $ls_theme
        set -gx LS_COLORS "$(vivid generate $ls_theme)"
    end

    fish_config theme choose $fish_theme
    set -Ux BAT_THEME $fish_theme
    set -Ux FZF_DEFAULT_OPTS $fzf_theme
end
