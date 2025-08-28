# Tool integrations and interactive shell setup
# This file handles third-party tool integrations that run only in interactive mode

# Only run integrations in interactive shell sessions
if status is-interactive

    # Pure prompt async configuration
    set -g async_prompt_functions _pure_prompt_git

    # Navi cheatsheet integration
    if type -q navi
        navi widget fish | source
    end

    # Enhanced man pages with bat
    if type -q sh; and type -q sed; and type -q bat
        set -x MANPAGER "sh -c 'sed -e s/.\\\\x08//g | bat -l man -p'"
    end

    # Shell history with Atuin
    if type -q atuin
        atuin init fish | source
    end

    # iTerm2 shell integration
    if test "$TERM_PROGRAM" = "iTerm.app"
        test -e "$HOME/.iterm2_shell_integration.fish"; and source "$HOME/.iterm2_shell_integration.fish"
    end


end
