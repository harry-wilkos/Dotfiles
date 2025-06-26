function copy --wraps=wl-copy --description 'alias copy=wl-copy'
  if test -t 0
    return
  end
  wl-copy $argv
  wl-paste
end
