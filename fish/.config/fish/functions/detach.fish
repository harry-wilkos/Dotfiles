function detach --wraps=nohup --wraps='nohup >/dev/null 2>&1 &' --description 'alias detach=nohup >/dev/null 2>&1 &'
    nohup $argv >/dev/null 2>&1 & 
end
