function gcm
    if not git rev-parse --is-inside-work-tree >/dev/null 2>&1
        return 1
    end
    set -l main (git symbolic-ref refs/remotes/origin/HEAD | awk -F/ '{print $NF}')
    git checkout "$main"
    git pull
end
