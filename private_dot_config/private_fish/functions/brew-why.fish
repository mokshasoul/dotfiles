function brew-why -d "List out all installed apps along with all the apps each app is dependent on."
    brew list -1 --formula | while read -l cask
        set_color blue
        echo -n " $cask "
        set_color normal
        brew uses "$cask" --installed | awk '{printf(" %s ", $0)}'
        echo ""
    end
end
