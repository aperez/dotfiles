setenv SSH_ENV $HOME/.ssh/environment

function start_ssh_agent
    pgrep -u "$USER" ssh-agent > /dev/null
    if [ $status != 0 ]
        ssh-agent -c > $SSH_ENV
    end
    if [ -z "$SSH_AGENT_PID" ]
        . $SSH_ENV > /dev/null
    end
end

