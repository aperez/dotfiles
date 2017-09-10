set fish_greeting ""

abbr --add g git
abbr --add gc 'git commit'
abbr --add gca 'git commit -a'
abbr --add gd 'git diff'
abbr --add gst 'git status'

start_ssh_agent

# Start X at login
if status --is-login
    set PATH $PATH /usr/bin /sbin
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        startx
    end
end
