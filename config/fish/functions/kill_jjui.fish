function kill_jjui --description 'kill jjui from the shell'
    set pid (pgrep jjui)
    kill -CONT $pid
    kill -TERM $pid
end
