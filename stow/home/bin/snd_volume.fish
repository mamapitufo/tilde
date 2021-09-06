#!/usr/bin/env fish
set output (snd_output)

amixer -qM sset $output 3%$argv[1]

