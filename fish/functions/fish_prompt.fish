function fish_prompt
    set -l stat $status
    echo
    string join '' -- (set_color blue) (prompt_pwd --full-length-dirs 5) " " (set_color normal) (_fish_prompt_jj)
    string join '' -- (set_color magenta) "» " (set_color normal)
end
