function gin --wraps='=git init && git remote add origin' --wraps='git init && git remote add origin' --description 'alias gin=git init && git remote add origin'
    git init 
    git remote add origin $argv
        
end
