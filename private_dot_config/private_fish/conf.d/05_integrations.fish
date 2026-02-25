# Tool integrations and interactive shell setup
# This file handles third-party tool integrations that run only in interactive mode

# Only run integrations in interactive shell sessions
if status is-interactive

    # Navi cheatsheet integration
    if command -q navi
        navi widget fish | builtin source
    end

    if command -q direnv
        direnv hook fish | builtin source
    end

    # Enhanced man pages with bat
    if command -q sh; and command -q sed; and command -q bat
        set -x MANPAGER "sh -c 'sed -e s/.\\\\x08//g | bat -l man -p'"
    end

    # Shell history with Atuin
    if command -q atuin
        atuin init fish | builtin source
    end

    # iTerm2 shell integration
    if test "$TERM_PROGRAM" = "iTerm.app"
        test -e "$HOME/.iterm2_shell_integration.fish"; and builtin source "$HOME/.iterm2_shell_integration.fish"
    end

    if command -q fnm
        fnm env --use-on-cd --shell fish | builtin source
    end

    if command -q zoxide
        zoxide init fish | builtin source
    end

    if test -d ~/.orbstack/shell
        fish_add_path -aP $HOME/.orbstack/bin
    end

    if command -q rbenv
        fish_add_path --move --prepend "$HOME/.rbenv/shims/"
    end
end
