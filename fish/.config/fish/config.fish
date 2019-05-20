set fish_greeting ""

set -l cosmic_latte_path ~/.config/nvim/plugged/cosmic_latte

if status is-interactive; and test -d $cosmic_latte_path
  source $cosmic_latte_path/shell/cosmic_latte_light.fish
	eval (dircolors -c $cosmic_latte_path/shell/dircolors)
end

set --universal fish_user_paths ~/bin ~/bin/gem ~/.npm-packages/bin ~/.cargo/bin

# /etc/profile sets this, and breaks it in the supplied `ls` function
set -ge LS_COLORS

set -x LANG en_GB.UTF-8
set -x TERMINAL kitty

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx BROWSER firefox

# Infinality mode in freetype (see http://blog.brunomiguel.net/geekices/how-to-get-good-font-rendering-in-void-linux)
set -u FREETYPE_PROPERTIES "truetype:interpreter-version=38"

launch_gnome_keyring

alias feh "feh -FxB black"

