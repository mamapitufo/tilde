set fish_greeting ""

set --universal fish_user_paths ~/bin ~/bin/gem ~/.npm-packages/bin ~/.cargo/bin ~/Library/charles/bin

# /etc/profile sets this, and breaks it in the supplied `ls` function
set -ge LS_COLORS

set -x LANG en_GB.UTF-8
set -x TERMINAL kitty

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx BROWSER firefox

set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow -g \"!.git/\"" 2>/dev/null
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_DEFAULT_OPTS "--color=light"

set -gx BAT_THEME "base16"
set -gx SVDIR ~/service
# set -gx _JAVA_OPTIONS "-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

# Infinality mode in freetype (see http://blog.brunomiguel.net/geekices/how-to-get-good-font-rendering-in-void-linux)
set -u FREETYPE_PROPERTIES "truetype:interpreter-version=38"

launch_gnome_keyring

alias feh "feh -FxB black"
alias mpvv "mpv --osd-bar-align-y=1 --osd-bar-w=99 --osd-level=2"

alias llatest "ls -1cr"
alias lsmallest "ls -1S"
alias llargest "ls -1Sr"

alias disown-all "disown (jobs -g)"

alias youtube-720p "youtube-dl --format 'bestvideo[height<=720][ext=mp4]+bestaudio[ext=m4a]'"

alias jstree "tree -I node_modules"

if status is-interactive; and test $TERM = "xterm-kitty"
  alias tmux "tmux -2"
end

set -l cosmic_latte_path ~/.config/nvim/plugged/cosmic_latte
if status is-interactive; and test -d $cosmic_latte_path
  source $cosmic_latte_path/shell/cosmic_latte_light.fish
  eval (dircolors -c $cosmic_latte_path/shell/dircolors)
end
