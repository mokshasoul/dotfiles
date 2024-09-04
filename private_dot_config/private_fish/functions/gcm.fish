function gcm
    set -l main (git symbolic-ref refs/remotes/origin/HEAD | awk -F/ '{print $NF}')
    git checkout "$main"
    git pull
end
