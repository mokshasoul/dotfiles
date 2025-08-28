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

# Docker optimizations
set -gx COMPOSE_DOCKER_CLI_BUILD 1
set -gx DOCKER_BUILDKIT 1

# Development paths
set -gx GOPATH "$HOME/.go"

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
    set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden -E bundles/ -E '.git/' -E '.cache/' -E '.terraform/'"
    set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
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
set -gx JAVA_HOME "/Users/moksha/Library/Caches/Coursier/arc/https/github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.24%252B8/OpenJDK11U-jdk_aarch64_mac_hotspot_11.0.24_8.tar.gz/jdk-11.0.24+8/Contents/Home"

# Login-specific settings
if status is-login
    # Nix system nvim binary (when available)
    set -l nix_path /run/current-system/sw/bin/nvim
    if test -e nix_path
        set -gx NVIM_BIN nix_path
    end
end
