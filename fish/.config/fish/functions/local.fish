function local --wraps='hostname --ip-addresses' --description 'alias local=hostname --ip-addresses'
  hostname --ip-addresses $argv
        
end
