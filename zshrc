# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="mortalscumbag"
#ZSH_THEME="nanotech"
#ZSH_THEME="pygmalion"
ZSH_THEME="etlgfx"
DISABLE_UNTRACKED_FILES_DIRTY="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git npm vi-mode)

source $ZSH/oh-my-zsh.sh
source $ZSH/lib/key-bindings.zsh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:/home/eric/.gem/ruby/2.1.0/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias ls='ls -aF --color=auto'
alias fgrep='fgrep --color=auto --exclude-dir=".svn" --exclude-dir=".git"'
alias egrep='egrep --color=auto --exclude-dir=".svn" --exclude-dir=".git"'
alias grep='grep --color=auto --exclude-dir=".svn" --exclude-dir=".git"'

function ec2-ls {
    aws ec2 describe-instances --profile=$AWS_PROFILE --output=table --query 'Reservations[].Instances[].[Tags[?Key==`Environment`]|[0].Value, Placement.AvailabilityZone, LaunchTime, InstanceId, InstanceType, Tags[?Key==`Name`]|[0].Value, PrivateIpAddress]' | grep "^|" | grep -v "DescribeInstances" | sed 's/|/ /g' | sort
}

function vf-ssh {
    COLOR_START="%F{085}"
    COLOR_END="%f"

    if [ $# -eq 1 ]
    then
        machine=`ec2-ls | grep $1 | head -n 1`
    elif [ $# -eq 2 ]
    then
        machine=`ec2-ls | grep $1 | grep $2 | head -n 1`
    elif [ $# -eq 3 ]
    then
        machine=`ec2-ls | grep $1 | grep $2 | grep $3 | head -n 1`
    else
        echo "Too many arguments"
        return
    fi

    print -P $COLOR_START $machine $COLOR_END
    ssh `echo $machine | awk '{print $7}'`
}

setopt HIST_IGNORE_DUPS
unsetopt beep
#bindkey -v
#bindkey ${terminfo[khome]} beginning-of-line
#bindkey ${terminfo[kend]} end-of-line
#bindkey ${terminfo[kdch1]} delete-char
#bindkey ${terminfo[kich1]} overwrite-mode
#bindkey  history-incremental-search-backward

function git-delete-branch {
    if [ $# != 1 ]; then
        return 1
    fi

    git branch -d $1 && git push origin :$1
    return $?
}

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export JAVA_HOME=/usr/lib/jvm/default
export GO_PATH=$HOME/go
