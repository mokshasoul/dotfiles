function rename-files-lowercase -d "#rename all files to lowercase"
    for f in * do
        mv "$f" (string lower $f)
    end
end
