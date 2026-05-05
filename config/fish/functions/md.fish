function md --wraps mkdir --description 'mkdir and cd into it'
         command mkdir -p $argv && cd $argv
end
