# ~/.bash_profile: executed by bash(1) for login shells.

if [ -z "$PS1" ]; then
    export PATH=~/bin/:/usr/local/bin/:${PATH}
elif [ -f ~/.bashrc ]; then
    . ~/.bashrc 
fi

