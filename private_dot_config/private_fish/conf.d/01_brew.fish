if test -d /opt/homebrew/bin
    set -gx HOMEBREW_PREFIX /opt/homebrew
    set -gx HOMEBREW_CELLAR $HOMEBREW_PREFIX/Cellar
    set -gx HOMEBREW_REPOSITORY $HOMEBREW_PREFIX

    set -gx HOMEBREW_BAT 7
    set -gx HOMEBREW_NO_AUTO_UPDATE 1

    fish_add_path $HOMEBREW_PREFIX/bin HOMEBREW_PREFIX/sbin

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
