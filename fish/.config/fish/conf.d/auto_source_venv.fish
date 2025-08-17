function __auto_source_venv --on-variable PWD --description "Activate/Deactivate virtualenv on directory change"
    status --is-command-substitution; and return
    if git rev-parse --show-toplevel &>/dev/null
        set gitdir (realpath (git rev-parse --show-toplevel))
        set cwd (pwd -P)

        set venv_folders env venv .env .venv

        while string match "$gitdir*" "$cwd" &>/dev/null
            for venv_folder in $venv_folders
                if test -e "$cwd/$venv_folder/bin/activate.fish"
                    source "$cwd/$venv_folder/bin/activate.fish" &>/dev/null
                    return
                end
            end
            set cwd (path dirname "$cwd")
        end
    end
    if test -n "$VIRTUAL_ENV"
        deactivate
    end
end
