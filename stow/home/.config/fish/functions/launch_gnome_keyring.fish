function launch_gnome_keyring --description "Launch `gnome-keyring-daemon` and export the `$S SH_AUTH_SOCK` variable"
	if not set -q SSH_AUTH_SOCK
		set -l socket_path (/usr/bin/gnome-keyring-daemon --start| awk -F"=" '$1 == "SSH_AUTH_SOCK" { print $2 }')

		set -gx SSH_AUTH_SOCK $socket_path
	end
end

