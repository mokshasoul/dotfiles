function theme_update -d "apply catppuccin theme based on OS_APPEARANCE variable"
    if not status is-interactive
        exit
    end
    set -f is_dark false
    set -f ls_theme catppuccin-latte
    set -gx OS_APPEARANCE Light
    if command -q osascript
        set -f is_dark (osascript -e 'tell application "System Events" to tell appearance preferences to return dark mode')
    end
    if test $is_dark = true
        set -gx OS_APPEARANCE Dark
        set -f ls_theme catppuccin-mocha
    end

    # LS_COLORS
    if command -q vivid
        set -gx LS_THEME $ls_theme
        set -gx LS_COLORS (vivid generate $ls_theme)
    end
end
