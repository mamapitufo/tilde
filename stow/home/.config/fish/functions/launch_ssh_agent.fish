function launch_ssh_agent --description "Launch `ssh-agent` if it is not running, source the environment variables otherwise"
	set -l SSH_AGENT_ENV $HOME/.ssh/ssh-agent-env
	set -l pid (pgrep -u $USER ssh-agent)
	set -l agent_count (count $pid)

	switch $agent_count
		case 0
			ssh-agent -c | sed "s/^echo/#echo/" > $SSH_AGENT_ENV
		case 1
			if set -q SSH_AGENT_PID[0]; and test $pid -ne $SSH_AGENT_PID
				log_error "$SSH_AGENT_PID information is out of date! Restarting..."
				kill $pid
				launch_ssh_agent
			end
		case "*"
			log_error "There is more than one ssh-agent running! Restarting..."
			for ag in $pid; kill $ag; end
			launch_ssh_agent
	end

	source $SSH_AGENT_ENV
end

