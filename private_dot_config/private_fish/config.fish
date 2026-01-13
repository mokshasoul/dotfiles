# Fish shell main configuration
# Most configuration has been organized into conf.d/ files for better maintainability
#
# Configuration loading order:
# 1. conf.d/01_brew.fish - Homebrew setup
# 2. conf.d/02_paths.fish - PATH management
# 3. conf.d/03_environment.fish - Environment variables
# 4. conf.d/04_aliases.fish - Aliases and abbreviations
# 5. conf.d/05_integrations.fish - Tool integrations
# 6. This file (config.fish) - Any remaining configuration

# Note: All major configuration has been moved to organized conf.d files
# Add any machine-specific or temporary configuration below if needed
if status is-interactive

    set -l theme_result (osascript -e 'tell application "System Events" to tell appearance preferences to return dark mode' 2>/dev/null)
    if test "$theme_result" = true
        set -gx OS_APPEARANCE Dark
    else
        set -gx OS_APPEARANCE Light
    end
    # FZF key bindings (needs to be in config.fish where functions are loaded)
    fzf_configure_bindings --directory=\ct
    update_theme
end
