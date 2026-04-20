function update_theme -d "apply catppuccin theme based on OS_APPEARANCE variable" --on-event fish_terminal_color_theme
    if not status is-interactive
        exit
    end
    set -f is_dark false
    set -f ls_theme catppuccin-latte
    if command -q osascript
        set -f is_dark (osascript -e 'tell application "System Events" to tell appearance preferences to return dark mode')
    end
    if test $is_dark = true
        set -gx --no-event OS_APPEARANCE $theme
        set -f ls_theme catppuccin-mocha
    end

    # LS_COLORS
    if command -q vivid
        set -gx LS_THEME $ls_theme
        set -gx LS_COLORS (vivid generate $ls_theme)
    end
end
