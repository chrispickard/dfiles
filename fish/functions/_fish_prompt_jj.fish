function _fish_prompt_jj
    set -l stuff (jj log -T 'format_short_change_id(change_id)' --color=always 2>/dev/null | head -1 | cut -d' ' -f3)
    set -l jj_stat $status
    if test $jj_stat -eq 0
        echo $stuff
    end
end

function _fish_prompt_jj_loading_indicator
    echo (set_color '#aaa')' … '(set_color normal)
end

set async_prompt_functions _fish_prompt_jj
