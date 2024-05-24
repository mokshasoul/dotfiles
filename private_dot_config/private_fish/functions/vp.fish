# Fuzzy find & edit
function vp
    if test (count $argv) -gt 0
        command $EDITOR $argv
    else
        fzf -m | xargs $EDITOR
    end
end
