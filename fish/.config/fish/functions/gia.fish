function gia --wraps='git add .' --description 'alias gia=git add .'
  git add . $argv
  git status        
end
