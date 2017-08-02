set fish_greeting ""

# /etc/profile sets this, and breaks it in the supplied `ls` function
set -ge LS_COLORS

set -x LANG en_GB.UTF-8
set -x TERMINAL alacritty

set -u EDITOR nvim
set -u VISUAL nvim
set -u BROWSER chromium

thefuck --alias| source

