function fish_prompt
    set -l stat $status
    echo
    string join '' -- (set_color blue) (prompt_pwd --full-length-dirs 5) " " (set_color normal) (_fish_prompt_jj)
    string join '' -- (set_color magenta) "» " (set_color normal)
end

function _fish_prompt_jj
    set -l stuff (jj log  --no-graph --ignore-working-copy --color=always --revisions @ -T 'change_id.shortest(8)' 2>/dev/null)
    set -l jj_stat $status
    if test $jj_stat -eq 0
        echo $stuff
    end
end
