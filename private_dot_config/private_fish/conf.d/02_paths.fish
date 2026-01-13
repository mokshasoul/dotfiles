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

# Use GOPATH variable instead of subshell for better performance
if test -d "$GOPATH/bin"
    fish_add_path "$GOPATH/bin"
end

if test -d "$HOME/Library/Application Support/Coursier/bin"
    fish_add_path "$HOME/Library/Application Support/Coursier/bin"
end

# Ruby (via Homebrew)
if type -q brew
    fish_add_path --path (brew --prefix ruby)/bin
end

# Bun JavaScript runtime
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path --prepend $BUN_INSTALL/bin

# Python 3.12 framework
fish_add_path --path --prepend "/Library/Frameworks/Python.framework/Versions/Current/bin"

# Hatch (Python project manager)
if test -f "/private/etc/paths.d/hatch"
    fish_add_path (cat /private/etc/paths.d/hatch)
end

set -gx RBENV_SHELL fish
fish_add_path --prepend '/Users/charis/.rbenv/shims'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/charis/google-cloud-sdk/path.fish.inc' ]
    builtin source '/Users/charis/google-cloud-sdk/path.fish.inc'
end

if [ -f "$HOME/.cargo/env.fish" ]
    builtin source "$HOME/.cargo/env.fish"
end

# >>> JVM installed by coursier >>>
set -gx JAVA_HOME "/Users/moksha/Library/Caches/Coursier/arc/https/github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.8%252B9/OpenJDK21U-jdk_aarch64_mac_hotspot_21.0.8_9.tar.gz/jdk-21.0.8+9/Contents/Home"
# <<< JVM installed by coursier <<<

fish_add_path --path $HOME/.local/bin

set -gx LDFLAGS -L/opt/homebrew/opt/mysql-client/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/mysql-client/include

set -gx PKG_CONFIG_PATH /opt/homebrew/opt/mysql-client/lib/pkgconfig

fish_add_path /opt/homebrew/opt/mysql-client/bin
