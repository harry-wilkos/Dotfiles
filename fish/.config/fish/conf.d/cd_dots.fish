function cd_dots
    set -l num_dots (string length $argv[1])
    if test (math "$num_dots % 2") -ne 0
        return
    end
    set -l levels (math "$num_dots / 2")
    set -l path ''
    for i in (seq $levels)
        set path "../$path"
    end
    cd $path
end

for n in (seq 2 2 20)
    set dots (string repeat -n $n ".")
    eval "function $dots; cd_dots $dots; end"
end
