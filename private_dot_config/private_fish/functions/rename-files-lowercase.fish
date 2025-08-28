function rename-files-lowercase -d "#rename all files to lowercase"
    for f in * do 
			mv "$f" "$f.tmp"
			mv "$f.tmp" "$(echo $f | tr "[:upper:]" "[:lower:]")"
    end
end
