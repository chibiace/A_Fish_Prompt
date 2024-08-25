# Hello Here :)
# https://github.com/chibiace/A_Fish_Prompt


function fish_prompt --description 'Write out the prompt'
    set -l normal (set_color normal)

    set -l prefix ''
    set -l suffix ''
    # set -l prefix ''
    # set -l suffix ''
    # set -l prefix ' '
    # set -l suffix ' '
    # set -l prefix ' ' 
    # set -l suffix ' '
    
    # Bumblebee
    set -l bgc '#FFAA00'
    set -l fgc '#181818'

    ### Icer ###
    # set -l bgc '#1793D1'
    # set -l fgc '#DDDAEC'

    ### Fire ###
    # set -l bgc '#FF4400'
    # set -l fgc '#FFEE44'

    ### Eponra Green ###
    # set -l bgc '#041D00'
    # set -l fgc '#5BC00A'
    # set -l suffix ' '

    set -q VIRTUAL_ENV_DISABLE_PROMPT
    or set -g VIRTUAL_ENV_DISABLE_PROMPT true

    set -l pwd (__fish_pwd)
    set -l max_length 35 

    if test (string length -- $pwd) -gt $max_length
        set pwd (prompt_pwd)
    end

    set -l prompt_start (set_color $bgc) $prefix (set_color -b $bgc) (set_color -o $fgc) " " $pwd " "
    set -l prompt_end $normal (set_color $bgc) $suffix (set_color -b normal)$normal " "

    echo -n -s $prompt_start $prompt_end
end

function fish_right_prompt --description 'Right side prompt'
    set -l normal (set_color normal)

    set -l prefix ''
    set -l suffix ''
    # set -l prefix ''
    # set -l suffix ''
    # set -l prefix ' '
    # set -l suffix ' '
    # set -l prefix ' ' 
    # set -l suffix ' '

    ### Bumble Bee ###     
    set -l bgc '#FFAA00'
    set -l fgc '#181818'
    set -l gitc '#181818'
    set -l venvc '#181818'

    ### Icer ###
    # set -l bgc '#1793D1'
    # set -l fgc '#DDDAEC'
    # set -l gitc '#3C36FE'
    # set -l venvc '#41FE4C'

    ### Fire ###
    # set -l bgc '#FF4400'
    # set -l fgc '#FFEE44'
    # set -l gitc '#FFAA00'
    # set -l venvc '#FFCC22'

    ### Eponra Green ###
    # set -l bgc '#041D00'
    # set -l fgc '#5BC00A'
    # set -l gitc '#184D07'
    # set -l venvc '#24730B'

    set -q VIRTUAL_ENV_DISABLE_PROMPT
    or set -g VIRTUAL_ENV_DISABLE_PROMPT true

    set -l time (date +"%H:%M:%S")

    set -l prompt_start (set_color $bgc) $prefix $normal (set_color -b $bgc) 
    set -l prompt_end (set_color -o $fgc) " " $time " " (set_color -b normal)(set_color $bgc) $suffix $normal

    set -l venv ""
    set -l git ""

    if test -n "$VIRTUAL_ENV"
        set venv (set_color -o $venvc ) " [" (basename "$VIRTUAL_ENV") "]"
    end

    if set git_prompt_output (fish_git_prompt 2>/dev/null); test -n "$git_prompt_output"
    # if test -n $fish_git_prompt
        set git (set_color -o $gitc) $git_prompt_output
    end

    echo -n -s $prompt_start $git $venv $prompt_end
end

