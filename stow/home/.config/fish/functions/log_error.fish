function log_error --description "Logs an error to the console"
	printf "%s[ERROR]%s %s\n" (set_color red) (set_color normal) $argv
end
