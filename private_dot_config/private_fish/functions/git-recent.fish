#!/usr/bin/env fish

function git-recent -d "show recent branches to select from"
    # stolen from: https://github.com/nicknisi/dotfiles/blob/main/bin/git-recent
    # git-recent - checkout recent branches with a fuzzy finder (FZF) list
    # credit to https://gist.github.com/srsholmes/5607e26c187922878943c50edfb245ef
    if not git rev-parse --is-inside-work-tree >/dev/null 2>&1
        echo "git-recent: not a git repository" >&2
        return 1
    end
    set -l branches (git branch --sort=-committerdate --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]')
    set -l branch (echo "$branches" | fzf --ansi)
    set -l selected_branch (echo "$branch" | awk '{print $1}' | tr -d '*')
    git checkout "$selected_branch"
end
