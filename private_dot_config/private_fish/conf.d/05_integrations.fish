# Tool integrations and interactive shell setup
# This file handles third-party tool integrations that run only in interactive mode

# Only run integrations in interactive shell sessions
if status is-interactive

    # Pure prompt async configuration
    set -g async_prompt_functions _pure_prompt_git

    # Navi cheatsheet integration
    if type -q navi
        navi widget fish | builtin source
    end

    # Enhanced man pages with bat
    if type -q sh; and type -q sed; and type -q bat
        set -x MANPAGER "sh -c 'sed -e s/.\\\\x08//g | bat -l man -p'"
    end

    # Shell history with Atuin
    if type -q atuin
        atuin init fish | builtin source
    end

    # iTerm2 shell integration
    if test "$TERM_PROGRAM" = "iTerm.app"
        test -e "$HOME/.iterm2_shell_integration.fish"; and builtin source "$HOME/.iterm2_shell_integration.fish"
    end

    if type -q fnm
        fnm env --use-on-cd --shell fish | builtin source
    end

    if type -q zoxide
        zoxide init fish | builtin source
    end

    # Added by OrbStack: command-line tools and integration
    # This won't be added again if you remove it.
    if test -d ~/.orbstack/shell
        # set -gx PATH ~/.orbstack/shell/bin $PATH
        builtin source ~/.orbstack/shell/init2.fish 2>/dev/null || :
        # set -gx ORBSTACK_SHELL_DIR ~/.orbstack/shell
    end

    if type -q rbenv
        rbenv init - fish | source
    end
end
