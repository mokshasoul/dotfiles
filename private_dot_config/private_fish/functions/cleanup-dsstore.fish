function cleanup-dsstore -d "recursively delete .DS_Store files from current directory"
    command find . -name '*.DS_Store' -type f -ls -delete
end
