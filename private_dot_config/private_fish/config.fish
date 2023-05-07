set fish_greeting

set -q XDG_CONFIG_HOME; or set -U XDG_CONFIG_HOME ~/.config
# Docker speed-ups
set -x COMPOSE_DOCKER_CLI_BUILD 1
set -x DOCKER_BUILDKIT 1

set -x LANG en_IE.UTF-8
set -x LC_ALL en_IE.UTF-8
set -x GOPATH $HOME/.go
set -x BAT_THEME GitHub

set -x NNN_COLORS 11112
set -x NNN_FCOLORS 0B0B04060006060009060B06
set -x RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/config

set -x EDITOR "nvim -f"
if test -f "$HOME/Applications/Neovide.app/Contents/MacOS/neovide"
    set -x VISUAL "$HOME/Applications/Neovide.app/Contents/MacOS/neovide --nofork"
end

if test -e "$HOME/.1password/agent.sock"
    # on OSX run this first:
    # mkdir -p ~/.1password && ln -s ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ~/.1password/agent.sock
    set -x SSH_AUTH_SOCK "$HOME/.1password/agent.sock"
end

# Navigation
function ..
    cd ..
end
function ...
    cd ../..
end
function ....
    cd ../../..
end
function .....
    cd ../../../..
end

alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"
# Paths
if test -d "$HOME/bin/"
    if not contains "$HOME/bin" $PATH
        fish_add_path "$HOME/bin/"
    end
end

if test -d "$HOME/.cargo/bin"
    fish_add_path "$HOME/.cargo/bin"
end

if test -d $HOME/.local/bin
    fish_add_path $HOME/.local/bin
end

if test -d (go env GOPATH)/bin
    fish_add_path (go env GOPATH)/bin
end


set -x FZF_DEFAULT_OPTS "--height 50% --layout=reverse --border"
if type -q fd
    set -x FZF_DEFAULT_COMMAND "fd --type f --hidden -E 'bundles/' -E '.git/' -E '.cache/'"
    set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
end

if type -q exa
    function ls
        command exa $argv
    end
    function ll
        command exa -lFh --icons --octal-permissions $argv
    end
end

if type -q dog
    function dig
        command dog $argv
    end
end

# Fuzzy find & edit
function vp
    if test (count $argv) -gt 0
        command $EDITOR $argv
    else
        fzf -m | xargs $EDITOR
    end
end

if status is-interactive

    if type -q direnv
        direnv hook fish | source
    end

    if type -q pipenv
        set pipenv_fish_fancy yes
    end

    if type -q navi
        navi widget fish | source
    end

    if type -q zoxide
        zoxide init fish | source
    end

    if type -q sh and type -q sed and type -q bat
        set -x MANPAGER "sh -c 'sed -e s/.\\\\x08//g | bat -l man -p'"
    end

    if type -q pyenv
        pyenv init - | source
        pyenv virtualenv-init - | source
    end
    if type -q brew
        if test -d (brew --prefix)"/share/fish/completions"
            if not contains "(brew --prefix)/share/fish/completions" $fish_complete_path
                set -x fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
            end
        end

        if test -d (brew --prefix)"/share/fish/vendor_completions.d"
            if not contains "(brew --prefix)/share/fish/vendor_completions.d" $fish_complete_path
                set -x fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
            end
        end

        fish_add_path (brew --prefix ruby)/bin
    end

    if type -q hub
        eval (hub alias -s)
    end

    test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish
end

if status is-login
    pyenv init --path | source
    # brew is already set using conf.d/brew
    set -x NVIM_BIN /opt/homebrew/bin/nvim
end
