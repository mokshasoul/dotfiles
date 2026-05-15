if test -d /opt/homebrew/bin
    set -gx HOMEBREW_PREFIX /opt/homebrew
    set -gx HOMEBREW_CELLAR $HOMEBREW_PREFIX/Cellar
    set -gx HOMEBREW_REPOSITORY $HOMEBREW_PREFIX

    set -gx HOMEBREW_BAT 1
    set -gx HOMEBREW_NO_AUTO_UPDATE 1
    set -l completions "$HOMEBREW_PREFIX/share/fish/completions"

    fish_add_path $HOMEBREW_PREFIX/bin $HOMEBREW_PREFIX/sbin

    # if not contains "$HOMEBREW_PREFIX/share/info" $INFOPATH
    #     set --global --export INFOPATH /opt/homebrew/share/info $INFOPATH
    # end
    if test -d "$HOMEBREW_PREFIX/share/fish/completions" && not contains $completions $fish_complete_path
        set -a fish_complete_path $completions
    end
end
