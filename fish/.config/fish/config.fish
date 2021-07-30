set fish_greeting ""

abbr --add g git
abbr --add gc 'git commit'
abbr --add gca 'git commit -a'
abbr --add gd 'git diff'
abbr --add gst 'git status'
abbr --add p 'pass -c'
abbr --add z 'zathura --fork'

abbr --add enc 'emacsclient -nc'
abbr --add en 'emacsclient -n'

setenv SSH_AUTH_SOCK $XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh
gpg-connect-agent updatestartuptty /bye > /dev/null

setenv ALTERNATE_EDITOR ""

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

