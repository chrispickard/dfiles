function ls --description 'List directory contents using eza if available, otherwise ls'
    if command -q eza
        eza $argv
    else
        command ls $argv
    end
end
