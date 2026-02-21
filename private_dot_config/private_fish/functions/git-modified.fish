# https://github.com/nicknisi/dotfiles/blob/main/bin/git-modified
function git-modified -d "list modified files"
    git ls-files -z | xargs -0 -I{} git log -1 --format="%ai {}" {}
end
