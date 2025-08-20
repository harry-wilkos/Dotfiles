function kill --wraps='killall -SEGV' --description 'alias kill=killall -SEGV'
  killall -SEGV $argv
        
end
