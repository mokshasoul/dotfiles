if test -d /opt/homebrew/bin
    set --global --export HOMEBREW_PREFIX /opt/homebrew

    set --global --export HOMEBREW_CELLAR /opt/homebrew/Cellar

    set --global --export HOMEBREW_REPOSITORY /opt/homebrew
    set --global --export HOMEBREW_BAT 7
    set --global --export HOMEBREW_NO_AUTO_UPDATE 1

    fish_add_path /opt/homebrew/bin /opt/homebrew/sbin

    if test -n "$MANPATH[1]"
        set --global --export --path MANPATH '' $MANPATH
    end

    if not contains "$HOMEBREW_PREFIX/share/info" $INFOPATH
        set --global --export --path INFOPATH /opt/homebrew/share/info $INFOPATH
    end
    if test -d "$HOMEBREW_PREFIX/share/fish/completions"
        set -p fish_complete_path "$HOMEBREW_PREFIX/share/fish/completions"
    end

    if test -d "$HOMEBREW_PREFIX/share/fish/vendor_completions.d"
        set -p fish_complete_path "$HOMEBREW_PREFIX/share/fish/vendor_completions.d"
    end
end
