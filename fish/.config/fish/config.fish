set fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
    if test -z (pgrep ssh-agent)
        eval (ssh-agent -c) > /dev/null
        set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
        set -Ux SSH_AGENT_PID $SSH_AGENT_PID
    end
end
