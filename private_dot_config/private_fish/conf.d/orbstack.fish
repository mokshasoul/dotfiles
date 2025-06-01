# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
if test -d ~/.orbstack/shell
    # set -gx PATH ~/.orbstack/shell/bin $PATH
    source ~/.orbstack/shell/init2.fish 2>/dev/null || :
    # set -gx ORBSTACK_SHELL_DIR ~/.orbstack/shell
end
