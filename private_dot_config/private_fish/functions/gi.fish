function gi -d "fetch .gitignore template from gitignore.io"
    if test (count $argv) -eq 0
        echo "Usage: gi <language> [language...]" >&2
        return 1
    end
    curl -sL https://www.toptal.com/developers/gitignore/api/(string join , $argv)
end
