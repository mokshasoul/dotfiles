function mvr_local -d "move files using rsync" --wraps rsync
    # If same filesystem, just mv
    set src_dev (stat -c %d $argv[1])
    set dst_dev (stat -c %d $argv[-1])
    if test "$src_dev" = "$dst_dev"
        mv $argv
    else
        rsync -rlt --partial --whole-file \
            --info=stats1,progress2 \
            --modify-window=1 \
            --remove-source-files $argv
    end
end
