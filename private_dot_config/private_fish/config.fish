set fish_greeting

# XDG Stuff
set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME "$HOME/.config"
set -q XDG_DATA_HOME; or set -gx XDG_DATA_HOME "$HOME/.local/share"
set -q XDG_CACHE_HOME; or set -gx XDG_CACHE_HOME "$HOME/.cache"
set --path -gx XDG_DATA_DIRS $XDG_DATA_DIRS /usr/local/share/ /usr/share/ /opt/homebrew/share/
set -q WORKSPACE; or set -gx WORKSPACE "$HOME/pws"

# Docker speed-ups
set -gx COMPOSE_DOCKER_CLI_BUILD 1
set -gx DOCKER_BUILDKIT 1

set -gx LANG en_IE.UTF-8
set -gx LC_ALL en_IE.UTF-8

set -gx GOPATH "$HOME/.go"

# nnn-Configuration
# https://github.com/catppuccin/catppuccin/discussions/1955
set -gx NNN_OPTS Ae
set -gx NNN_COLORS "#04020301;4231"
set -gx NNN_FCOLORS 030304020705050801060301
set -gx NNN_USE_EDITOR 1

set -gx RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/config
set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR
if test -d /opt/homebrew/opt/gnu-tar/libexec/gnubin
    fish_add_path --prepend /opt/homebrew/opt/gnu-tar/libexec/gnubin
end
if test -z "$SSH_CONNECTION"
    # Native gnome
    # set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gcr/ssh"
    # 1p
    if test -e "$HOME/.1password/agent.sock"
        # on OSX run this first:
        # mkdir -p ~/.1password && ln -s ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ~/.1password/agent.sock
        set -x SSH_AUTH_SOCK "$HOME/.1password/agent.sock"
    end
end

# Pure configs
set -g async_prompt_functions _pure_prompt_git # run this async! dope.

# Paths
if test -d "$HOME/bin/"
    if not contains "$HOME/bin" $PATH
        fish_add_path "$HOME/bin"
    end
end

if test -d "$HOME/.cargo/bin"
    fish_add_path "$HOME/.cargo/bin"
end

if test -d "$HOME/.local/bin"
    fish_add_path "$HOME/.local/bin"
end

if test -d "$(go env GOPATH)/bin"
    fish_add_path "$(go env GOPATH)/bin"
end

if test -d "$HOME/Library/Application Support/Coursier/bin"
    fish_add_path "$HOME/Library/Application Support/Coursier/bin"
end

if type -q fd
    set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden -E bundles/ -E '.git/' -E '.cache/' -E '.terraform/'"
    set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
end

if type -q lsd
    function ll --wraps lsd
        command lsd -lFh --icon auto $argv
    end
    function la --wraps lsd
        command lsd -la $argv
    end
    function l --wraps lsd
        command lsd -l -g --git $argv
    end
end

if type -q gem
    set -gx GEM_HOME (gem env user_gemhome)
    fish_add_path "$GEM_HOME/bin"
end

if status is-login
    # brew is already set using conf.d/brew
    set -gx NVIM_BIN /run/current-system/sw/bin/nvim
end

if status is-interactive

    if type -q navi
        navi widget fish | source
    end

    if type -q sh; and type -q sed; and type -q bat
        set -x MANPAGER "sh -c 'sed -e s/.\\\\x08//g | bat -l man -p'"
    end

    if type -q pyenv
        pyenv init - | source
        if not set -q PYENV_ROOT
            set -gx PYENV_ROOT $HOME/.pyenv
        end
    end

    if type -q brew
        if test -d "$HOMEBREW_PREFIX/share/fish/completions"
            if not contains "$HOMEBREW_PREFIX/share/fish/completions" (string split " " $fish_complete_path)
                set -p fish_complete_path (brew --prefix)/share/fish/completions
            end
        end

        if test -d "$HOMEBREW_PREFIX/share/fish/vendor_completions.d"
            if not contains "$HOMEBREW_PREFIX/share/fish/vendor_completions.d" (string split " " $fish_complete_path)
                set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
            end
        end

        fish_add_path (brew --prefix ruby)/bin
    end

    if type -q atuin
        atuin init fish | source
    end

    if [ "$TERM_PROGRAM" = "iTerm.app" ]
        test -e "$HOME/.iterm2_shell_integration.fish"; and source "$HOME/.iterm2_shell_integration.fish"
    end
    update_theme

    fzf_configure_bindings --directory=\ct

end

## Editor abbr
abbr vim nvim
abbr vi nvim
abbr v nvim

# bun
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path --path --prepend $BUN_INSTALL/bin

# Setting PATH for Python 3.12
# The original version is saved in /Users/moksha/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.12/bin" "$PATH"
set -gx PIPX_DEFAULT_PYTHON (which python3)

if test -f "/private/etc/paths.d/hatch"
    fish_add_path (cat /private/etc/paths.d/hatch)
end

# >>> JVM installed by coursier >>>
set -gx JAVA_HOME "/Users/moksha/Library/Caches/Coursier/arc/https/github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.24%252B8/OpenJDK11U-jdk_aarch64_mac_hotspot_11.0.24_8.tar.gz/jdk-11.0.24+8/Contents/Home"
# <<< JVM installed by coursier <<<
