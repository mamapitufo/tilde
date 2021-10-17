set fish_color_cwd blue --bold
set fish_color_time white
set fish_color_failed red --bold

set fish_prompt_pwd_dir_length 0

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

function fish_prompt --description "Write out the prompt"
	set last_status $status
	printf "┌ "
	set_color $fish_color_time
	printf "%s" (date "+%d/%m %H:%M:%S ")
	set_color $fish_color_cwd
	printf "%s" (prompt_pwd)

	set_color normal
	printf "\n└%s " (__fish_git_prompt)
	if test $last_status -ne 0
		set_color $fish_color_failed
		printf "!!"
		set_color normal
	else
		printf "λ"
	end
	printf " "
end
