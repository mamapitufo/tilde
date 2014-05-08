# ~/.bash_profile: executed by bash(1) for login shells.

if [ -z "$PS1" ]; then
    export PATH=~/bin/:/usr/local/bin/:${PATH}
elif [ -f ~/.bashrc ]; then
    . ~/.bashrc 
fi

LC_ALL=en_GB.UTF-8
LANG=en_GB.UTF-8

export LC_ALL LANG

