function gcm -d "checkout and pull default branch"
    if not git rev-parse --is-inside-work-tree >/dev/null 2>&1
        return 1
    end
    set -l main (git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | awk -F/ '{print $NF}')
    if test -z "$main"
        echo "gcm: could not determine default branch" >&2
        return 1
    end
    git checkout "$main"
    git pull
end
