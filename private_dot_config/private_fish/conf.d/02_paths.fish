# PATH management
# This file handles all PATH additions for various tools and languages

# GNU tar (prefer over BSD tar)
if test -d /opt/homebrew/opt/gnu-tar/libexec/gnubin
    fish_add_path --prepend /opt/homebrew/opt/gnu-tar/libexec/gnubin
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

# Use GOPATH variable instead of subshell for better performance
if test -d "$GOPATH/bin"
    fish_add_path "$GOPATH/bin"
end

if test -d "$HOME/Library/Application Support/Coursier/bin"
    fish_add_path "$HOME/Library/Application Support/Coursier/bin"
end

# Ruby (via Homebrew)
if type -q brew
    fish_add_path (brew --prefix ruby)/bin
end

# Ruby gems
if type -q gem
    set -gx GEM_HOME (gem env user_gemhome)
    fish_add_path "$GEM_HOME/bin"
end

# Bun JavaScript runtime
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path --prepend $BUN_INSTALL/bin

# Python 3.12 framework
fish_add_path --prepend "/Library/Frameworks/Python.framework/Versions/3.12/bin"

# Hatch (Python project manager)
if test -f "/private/etc/paths.d/hatch"
    fish_add_path (cat /private/etc/paths.d/hatch)
end