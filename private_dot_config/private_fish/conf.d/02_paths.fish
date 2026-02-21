# PATH management
# This file handles all PATH additions for various tools and languages

# GNU tar (prefer over BSD tar)
if test -d /opt/homebrew/opt/gnu-tar/libexec/gnubin
    fish_add_path --prepend /opt/homebrew/opt/gnu-tar/libexec/gnubin
end

# uutils path
if test -d /opt/homebrew/opt/uutils-coreutils/libexec/uubin
    fish_add_path --prepend /opt/homebrew/opt/uutils-coreutils/libexec/uubin
end

if test -d /opt/homebrew/opt/coreutils/libexec/gnubin
    fish_add_path --prepend /opt/homebrew/opt/coreutils/libexec/gnubin
end

# User binaries
if test -d "$HOME/bin"
    fish_add_path "$HOME/bin"
end

if test -d "$HOME/.local/bin"
    fish_add_path "$HOME/.local/bin"
end

# Language-specific paths
if test -d "$HOME/.cargo/bin"
    fish_add_path "$HOME/.cargo/bin"
end

if test -d "$HOME/Library/Application Support/Coursier/bin"
    fish_add_path "$HOME/Library/Application Support/Coursier/bin"
end

# Ruby (via Homebrew)
if type -q brew
    fish_add_path --path (brew --prefix ruby)/bin
end

fish_add_path --prepend $BUN_INSTALL/bin

# Hatch (Python project manager)
if test -f "/private/etc/paths.d/hatch"
    fish_add_path (cat /private/etc/paths.d/hatch)
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.fish.inc" ]
    builtin source "$HOME/google-cloud-sdk/path.fish.inc"
end

if [ -f "$HOME/.cargo/env.fish" ]
    builtin source "$HOME/.cargo/env.fish"
end

fish_add_path /opt/homebrew/opt/mysql-client/bin

# Development paths
set -gx GOPATH "$HOME/.go"

# Use GOPATH variable instead of subshell for better performance
if test -d "$GOPATH/bin"
    fish_add_path "$GOPATH/bin"
end

# Python 3 Current framework
fish_add_path --move --prepend "/Library/Frameworks/Python.framework/Versions/Current/bin"
if test -d "$HOME/.orbstack/shell/bin"
    fish_add_path "$HOME/.orbstack/shell/bin"
end
