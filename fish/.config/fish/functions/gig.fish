function gig --wraps='git rm -r --cached . && gia' --description 'alias gig=git rm -r --cached . && gia'
  git rm -r --cached . && gia $argv
        
end
