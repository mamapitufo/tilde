function log_info --description "Logs an informational message to the console"
	printf "%s[INFO]%s %s\n" (set_color blue) (set_color normal) $argv
end
