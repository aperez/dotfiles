set fish_greeting ""

alias cat="bat"

alias ls="eza --group-directories-first"
alias ll="eza --group-directories-first --long --git --all --header"
alias la="eza --group-directories-first --long --git --all --header"

alias tree="eza --tree"

if status is-interactive
    # Commands to run in interactive sessions can go here
    if test -z (pgrep ssh-agent)
        eval (ssh-agent -c) > /dev/null
        set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
        set -Ux SSH_AGENT_PID $SSH_AGENT_PID
    end
end

set -gx FZF_DEFAULT_COMMAND "fd --hidden --follow"

set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND "--type=f"
set -gx FZF_CTRL_T_OPTS "--preview='bat --style=numbers --color=always {}'"
set -gx FZF_ALT_C_COMMAND $FZF_DEFAULT_COMMAND "--type=d"
set -gx FZF_ALT_C_OPTS "--preview='eza --tree --all --color=always --git-ignore {}'"

fzf --fish | source
zoxide init fish | source
