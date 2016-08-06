# ~/.bashrc: executed by bash(1) for non-login shells.

# vi mode for readline
# set -o vi

[ -z "$PS1" ] && return
export HISTCONTROL="ignoreboth"
export HISTIGNORE="&:l:[bf]g:exit"

PS1='\e[1;94m\D{%Y-%m-%d %T}\e[0m \e[0;34m\w\e[0m\n$(__git_ps1 "(%s) ")λ '

case "$TERM" in
xterm*|rxvt*|screen*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

PATH=/usr/local/bin:${PATH}:/usr/local/sbin

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

EDITOR=nvim
VISUAL=nvim
export EDITOR VISUAL

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
LESS="-R"
export LESS GIT_PS1_SHOWDIRTYSTATE GIT_PS1_SHOWCOLORHINTS

# System specific actions
SYSTEM=`uname -s`
if [ ${SYSTEM} = "Linux" ]; then

    [ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

    if [ "$TERM" != "dumb" ]; then
        eval "`dircolors -b`"
    fi

elif [ ${SYSTEM} = "Darwin" ]; then

    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi

    HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/Applications/Caskroom"
    export HOMEBREW_CASK_OPTS

    [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

    JAVA_HOME=$(/usr/libexec/java_home)
    export JAVA_HOME
fi

if [ -d ~/bin ]; then
    PATH=~/bin:${PATH}
fi

if [ -d ~/.cabal/bin ]; then
    PATH=~/.cabal/bin:${PATH}
fi

if hash gulp 2>/dev/null; then
  eval "$(gulp --completion=bash)"
fi

export PATH MANPATH

if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi

