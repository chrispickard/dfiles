function umux --description 'loads tmuxp, installing it if it doesnt exist'
    if test ! (command -v tmuxp)
        uv tool install tmuxp
    end
    tmuxp load -y work $argv
end