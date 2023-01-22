function fish_prompt
    echo -n (set_color green)'['(set_color red)(whoami)(set_color yellow)@(set_color green)(prompt_hostname) (set_color blue)(prompt_pwd)(set_color green)']'(set_color blue) 'λ '
    set -U fish_color_command white
end
