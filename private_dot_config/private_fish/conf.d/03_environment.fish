# Environment variables
# This file sets up all environment variables and global settings

# Disable fish greeting
set fish_greeting

# XDG Base Directory Specification
set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME "$HOME/.config"
set -q XDG_DATA_HOME; or set -gx XDG_DATA_HOME "$HOME/.local/share"
set -q XDG_CACHE_HOME; or set -gx XDG_CACHE_HOME "$HOME/.cache"
set --path -gx XDG_DATA_DIRS $XDG_DATA_DIRS /usr/local/share/ /usr/share/ /opt/homebrew/share/
set -q WORKSPACE; or set -gx WORKSPACE "$HOME/pws"

# Locale settings
set -gx LANG en_IE.UTF-8
set -gx LC_ALL en_IE.UTF-8

# Editor configuration
set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

# Tool-specific environment variables
set -gx RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/config
set -gx PIPX_DEFAULT_PYTHON (which python3)

# nnn file manager configuration
# Theme: https://github.com/catppuccin/catppuccin/discussions/1955
set -gx NNN_OPTS Ae
set -gx NNN_COLORS "#04020301;4231"
set -gx NNN_FCOLORS 030304020705050801060301
set -gx NNN_USE_EDITOR 1

# FZF configuration
if type -q fd
    set -gx FZF_CTRL_T_COMMAND "fd --type f --hidden -E bundles/ -E '.git/' -E '.cache/' -E '.terraform/'"
end

# SSH Agent (1Password)
if test -z "$SSH_CONNECTION"
    if test -e "$HOME/.1password/agent.sock"
        # on OSX run this first:
        # mkdir -p ~/.1password && ln -s ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ~/.1password/agent.sock
        set -x SSH_AUTH_SOCK "$HOME/.1password/agent.sock"
    end
end

# Java (via Coursier)
# >>> JVM installed by coursier >>>
set -gx JAVA_HOME "$HOME/Library/Caches/Coursier/arc/https/github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.8%252B9/OpenJDK21U-jdk_aarch64_mac_hotspot_21.0.8_9.tar.gz/jdk-21.0.8+9/Contents/Home"
# <<< JVM installed by coursier <<<
set -gx LDFLAGS -L/opt/homebrew/opt/mysql-client/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/mysql-client/include
set -gx PKG_CONFIG_PATH /opt/homebrew/opt/mysql-client/lib/pkgconfig
set -gx RBENV_SHELL fish
# Bun JavaScript runtime
set -gx BUN_INSTALL "$HOME/.bun"
set -gx ORBSTACK_SHELL_DIR "$HOME/.orbstack/shell"
