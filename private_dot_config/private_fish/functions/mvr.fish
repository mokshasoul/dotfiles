function mvr -d "move files using rsync" --wraps rsync
    rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-files $argv
end
