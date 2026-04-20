# PATH management
# This file handles all PATH additions for various tools and languages

# User binaries
if status is-interactive
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

    # Ruby (via Homebrew)
    if command -q brew
        set -l ruby_prefix (brew --prefix ruby 2>/dev/null)
        if test -d "$ruby_prefix/bin"
            fish_add_path $ruby_prefix/bin
        end
    end

    # Bun JavaScript runtime
    set -gx BUN_INSTALL "$HOME/.bun"
    if test -d "$BUN_INSTALL/bin"
        fish_add_path "$BUN_INSTALL/bin"
    end

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

    if test -d /opt/homebrew/opt/mysql-client/bin
        fish_add_path /opt/homebrew/opt/mysql-client/bin
    end

    if test -d "$HOME/.opencode/bin"
        fish_add_path "$HOME/.opencode/bin"
    end

    # Development paths
    set -gx GOPATH "$HOME/.go"

    # Use GOPATH variable instead of subshell for better performance
    if test -d "$GOPATH/bin"
        fish_add_path "$GOPATH/bin"
    end

    if test -d "$HOME/.orbstack/shell/bin"
        fish_add_path "$HOME/.orbstack/shell/bin"
    end
end

if command -q xcode-select
    fish_add_path (xcode-select -p)
end
# Python 3 Current framework
fish_add_path --move --prepend "/Library/Frameworks/Python.framework/Versions/Current/bin"
