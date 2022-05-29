# ~/.profile

LC_ALL=en_GB.UTF-8
LANG=en_GB.UTF-8
export LC_ALL LANG

XDG_CONFIG_HOME=$HOME/.config
XDG_DATA_HOME=$HOME/.local/share
XDG_STATE_HOME=$HOME/.local/state
XDG_CACHE_HOME=$HOME/.cache

export XDG_CACHE_HOME XDG_STATE_HOME XDG_DATA_HOME XDG_CONFIG_HOME

if [ `pgrep -cx tresorit-daemon` -eq 0 ]; then
    ~/.local/share/tresorit/tresorit-daemon
fi
