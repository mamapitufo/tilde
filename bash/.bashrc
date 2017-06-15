# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL="ignoreboth"
export HISTIGNORE="&:l:[bf]g:exit"

PS1='\e[1;94m\D{%Y-%m-%d %T}\e[0m \e[0;34m\w\e[0m\n$(__git_ps1 "(%s) ")λ '

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

EDITOR=nvim
VISUAL=nvim
export EDITOR VISUAL

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
LESS="-R"
export LESS GIT_PS1_SHOWDIRTYSTATE GIT_PS1_SHOWCOLORHINTS

SYSTEM=`uname -s`
if [ ${SYSTEM} = "Linux" ]; then

    eval `dircolors ~/.config/coreutils/dircolors.256dark`

    [[ -f /usr/share/git/git-prompt.sh ]] && . /usr/share/git/git-prompt.sh

elif [ ${SYSTEM} = "Darwin" ]; then

    [[ -f `brew --prefix`/etc/bash_completion ]] && . `brew --prefix`/etc/bash_completion

    HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/Applications/Caskroom"
    export HOMEBREW_CASK_OPTS

    [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh


    [[ ~/.gem/ruby/2.0.0/bin/ ]] && PATH=~/.gem/ruby/2.0.0/bin/:${PATH}
    [[ ~/Library/Python/2.7/bin  ]] && PATH=~/Library/Python/2.7/bin:${PATH}

    JAVA_HOME=$(/usr/libexec/java_home)
    export JAVA_HOME
fi

[[ -d ~/bin ]] && PATH=~/bin:${PATH}
export PATH

[[ -f ~/.bashrc_local ]] && source ~/.bashrc_local

