# Environment variables
# This file sets up all environment variables and global settings

# Disable fish greeting
set -gx SHELL $__fish_bin_dir/fish
set fish_greeting

# XDG Base Directory Specification
set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME "$HOME/.config"
set -q XDG_DATA_HOME; or set -gx XDG_DATA_HOME "$HOME/.local/share"
set -q XDG_CACHE_HOME; or set -gx XDG_CACHE_HOME "$HOME/.cache"
set -q XDG_DATA_DIRS; or set -gx --path XDG_DATA_DIRS
set -q WORKSPACE; or set -gx WORKSPACE "$HOME/pws"

# Locale settings
set -gx LANG en_IE.UTF-8
set -gx LC_ALL en_IE.UTF-8

# Editor configuration
set -gx EDITOR (command -v nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

# Tool-specific environment variables
set -gx RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/config
set -gx PIPX_DEFAULT_PYTHON (command -v python3)

if command -q gh
    set -gx GITHUB_PERSONAL_ACCESS_TOKEN (gh auth token)
end

# SSH Agent (1Password)
if test -z "$SSH_CONNECTION"
    if not test -e "$HOME/.1password/agent.sock"
        if fish_in_macos_terminal
            mkdir -p ~/.1password && ln -s ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ~/.1password/agent.sock
        end
    end
    set -gx SSH_AUTH_SOCK "$HOME/.1password/agent.sock"
end

fish_in_macos_terminal; and set -gx JAVA_HOME (/usr/libexec/java_home 2>/dev/null)
# set -gx LDFLAGS -L/opt/homebrew/opt/mysql-client/lib
# set -gx CPPFLAGS -I/opt/homebrew/opt/mysql-client/include
# set -gx PKG_CONFIG_PATH /opt/homebrew/opt/mysql-client/lib/pkgconfig
set -gx RBENV_SHELL fish
set -gx ORBSTACK_SHELL_DIR "$HOME/.orbstack/shell"
