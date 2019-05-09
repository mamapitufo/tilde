set fish_color_cwd blue
set fish_color_time black --bold

set fish_prompt_pwd_dir_length 0

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

function fish_prompt --description "Write out the prompt"
	printf "┌ "
	set_color $fish_color_time
	printf "%s" (date "+%d/%m %H:%M:%S ")
	set_color $fish_color_cwd
	printf "%s" (prompt_pwd)

	set_color normal
	printf "\n└%s λ " (__fish_git_prompt)
end

