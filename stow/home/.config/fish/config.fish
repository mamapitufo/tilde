set fish_greeting ""

set --universal fish_user_paths ~/.local/bin ~/bin ~/bin/gem ~/.npm-packages/bin ~/.cargo/bin ~/Library/charles/bin

#-- tide prompt config
set --global tide_left_prompt_frame_enabled true
set --global tide_left_prompt_prefix ' '
set --global tide_lfet_prompt_items pwd git newline character
set --global tide_right_prompt_frame_enabled true
set --global tide_right_prompt_suffix ' '
set --global tide_right_prompt_items time newline status cmd_duration context jobs
set --global tide_character_icon ' λ'
set --global tide_time_color grey
set --global tide_time_format '%d/%m %H:%M:%S'
set --global tide_cmd_duration_color grey

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

alias jstree "tree -I node_modules"

if status is-interactive; and test $TERM = "xterm-kitty"
  alias tmux "tmux -2"
end

eval (dircolors -c ~/.dircolors)

set -l theme_path ~/.config/fish/zenbones.fish
if status is-interactive; and test -f $theme_path
  source $theme_path
end

# Homebrew
if test -d ~/.linuxbrew
  eval (~/.linuxbrew/bin/brew shellenv)
end
