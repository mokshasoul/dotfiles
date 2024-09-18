if type -q dog
    function dig --wraps dog
        command dog $argv
    end
else
    function dig
        echo "dog is not installed. Please install dog."
    end
end
