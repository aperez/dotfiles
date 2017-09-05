set fish_greeting ""

start_ssh_agent

# Start X at login
if status --is-login
    set PATH $PATH /usr/bin /sbin
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        startx
    end
end

