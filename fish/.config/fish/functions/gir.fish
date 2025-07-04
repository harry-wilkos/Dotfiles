function gir --wraps='git fetch --all && git reset --hard origin/main' \
              --description 'alias gir=git fetch --all && git reset --hard origin/main'
    echo "This will reset your current branch to origin/main and discard local changes."
    set -l confirm

    read -l -P "Are you sure you want to proceed? (y/N): " confirm

    if test "$confirm" = "y" -o "$confirm" = "Y"
        git fetch --all
        git reset --hard origin/main $argv
    else
        echo "Reset canceled."
    end
end

