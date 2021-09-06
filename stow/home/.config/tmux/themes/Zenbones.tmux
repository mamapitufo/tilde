#-- Zenbones, modified by mamapitufo

set -g status-left '#[fg=#564e4a,bg=#d2a6c8,bold] %d/%m %H:%M '
set -g status-right ' #[fg=#88507d,bold] [#S] '
set -g status-style fg=#88507d,bg=#f0edec
set -g status-left-length 13
set -g status-justify left

set -g window-status-format ' #I:#W#{?window_flags,#{window_flags}, } '
set -g window-status-style fg=#b2a39b,bg=#f0edec,bold
set -g window-status-current-format ' #I:#W#{?window_flags,#{window_flags}, } '
set -g window-status-current-style fg=#88507d,bg=#f0edec,bold

set -g pane-border-style fg=#c4b6af
set -g pane-active-border-style fg=#564e4a,dim

set -g message-style fg=#2c363c,bg=#d2dfe7

set -g mode-style fg=#c4b6af

set -g display-panes-active-colour #88507d
set -g display-panes-colour #b2a39b
