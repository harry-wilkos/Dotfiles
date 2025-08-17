function gin --description 'Initialize git and optionally add a remote'
    git init

    if test (count $argv) -gt 0
        git remote add origin $argv
    end
end
