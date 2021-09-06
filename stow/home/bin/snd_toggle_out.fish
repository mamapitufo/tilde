#!/usr/bin/env fish
amixer -q sset Master toggle
set master_state (amixer get Master| grep -Eo '\[o(n|ff)\]$')

set output (snd_output)

if test $master_state = "[on]"
	amixer -q sset $output unmute
else
	amixer -q sset $output mute
end

