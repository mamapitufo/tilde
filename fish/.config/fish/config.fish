set fish_greeting ""

set PATH ~/bin ~/bin/gem $PATH

# /etc/profile sets this, and breaks it in the supplied `ls` function
set -ge LS_COLORS

set -x LANG en_GB.UTF-8
set -x TERMINAL alacritty

set -u EDITOR nvim
set -u VISUAL nvim
set -u BROWSER chromium

# Infinality mode in freetype (see
# http://blog.brunomiguel.net/geekices/how-to-get-good-font-rendering-in-void-linux)
set -u FREETYPE_PROPERTIES "truetype:interpreter-version=38"

#thefuck --alias| source
launch_ssh_agent

alias feh "feh -FxB black"

