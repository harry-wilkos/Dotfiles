function gist --wraps='git status' --description 'alias gist=git status'
    git status $argv    
    echo ""
    git fetch
end
