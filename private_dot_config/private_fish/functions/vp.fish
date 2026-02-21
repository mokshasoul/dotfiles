function vp -d "fuzzy find and edit files"
    if test (count $argv) -gt 0
        command $EDITOR $argv
    else
        fzf -m | while read -l file
            $EDITOR $file
        end
    end
end
