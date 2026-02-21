function shibbo -d "manage shibboleth secrets"
    if not command -q sc
        echo "sc not found"
        return 1
    end
    switch $argv[1]
        case edit
            sc shibboleth edit $argv[2..]
        case show
            sc shibboleth decrypt $argv[2..]
        case '*'
            echo "usage: shibbo edit|show [args]"
            return 1
    end
end
