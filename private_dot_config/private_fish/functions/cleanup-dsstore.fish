function cleanup-dsstore
	command find . -name '*.DS_Store' -type f -ls -delete
end
