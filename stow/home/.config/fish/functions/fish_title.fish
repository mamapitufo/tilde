function fish_title --description "Terminal title will look like 'path: command'"
	set -q argv[1]; or set argv fish
	echo (prompt_pwd): $argv;
end
