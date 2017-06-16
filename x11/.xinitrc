setxkbmap us_intl
[[ -x /usr/bin/VBoxClient ]] && VBoxClient --clipboard
[[ -x /usr/bin/VBoxClient ]] && VBoxClient --seamless
exec i3
