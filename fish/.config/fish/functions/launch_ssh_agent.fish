setenv SSH_AGENT_ENV $HOME/.ssh/ssh-agent-env

function launch_ssh_agent --description "Launch `ssh-agent` if it is not running, source the environment variables otherwise"
	if set -q SSH_AGENT_PID
		set -l pid (pgrep -u $USER ssh-agent)
		if test $pid -ne $SSH_AGENT_PID
			log_error '$SSH_AGENT_PID information is out of date!'
		end
	else
		ssh-agent -c | sed "s/^echo/#echo/" > $SSH_AGENT_ENV
	end

	. $SSH_AGENT_ENV
end

