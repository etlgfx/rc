ZSH=$HOME/.oh-my-zsh
ZSH_THEME="etlgfx"
DISABLE_UNTRACKED_FILES_DIRTY="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git npm vi-mode)


source $ZSH/oh-my-zsh.sh
source $ZSH/lib/key-bindings.zsh

export EDITOR='vim'

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
SAVEHIST=1000
unsetopt beep
#bindkey -v
# End of lines configured by zsh-newuser-install

#PS1="%{[01;33m%}%n@%m %{[01;32m%}%~%{[0m%}%# "
alias ls='ls -aF --color=auto'
alias fgrep='fgrep --color=auto --exclude-dir=".svn" --exclude-dir=".git"'
alias egrep='egrep --color=auto --exclude-dir=".svn" --exclude-dir=".git"'
alias grep='grep --color=auto --exclude-dir=".svn" --exclude-dir=".git"'

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
	export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi

