export TERM='xterm-256color'

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
#plugins=(git)
plugins=()

source $ZSH/oh-my-zsh.sh
source $ZSH/lib/key-bindings.zsh

# User configuration

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

if [[ `uname` == "Darwin" ]]; then
    alias ls='ls -aFG'
else
    alias ls='ls -aF --color=auto'
    alias fgrep='fgrep --color=auto --exclude-dir=".svn" --exclude-dir=".git"'
    alias egrep='egrep --color=auto --exclude-dir=".svn" --exclude-dir=".git"'
    alias grep='grep --color=auto --exclude-dir=".svn" --exclude-dir=".git"'
fi

alias vim='nvim'

setopt HIST_IGNORE_DUPS
unsetopt beep
#bindkey -v
#bindkey ${terminfo[khome]} beginning-of-line
#bindkey ${terminfo[kend]} end-of-line
#bindkey ${terminfo[kdch1]} delete-char
#bindkey ${terminfo[kich1]} overwrite-mode
#bindkey  history-incremental-search-backward

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

export GO111MODULE="auto"
export PATH=$PATH:/usr/local/bin/go/bin
export JAVA_HOME=/usr/local/opt/openjdk@11/bin
#export GOPATH=$HOME/go

if [[ -f /opt/dev/dev.sh ]]; then source /opt/dev/dev.sh; fi
if [ -e /Users/ericliang/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/ericliang/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

git_prompt_info() {}

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

export PYENV_SHELL=zsh
PYENV_VERSION=`pyenv --version | awk '{print $2}'`
source "/usr/local/Cellar/pyenv/${PYENV_VERSION}/completions/pyenv.zsh"

command pyenv rehash 2>/dev/null
pyenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(pyenv "sh-$command" "$@")"
    ;;
  *)
    command pyenv "$command" "$@"
    ;;
  esac
}

function sql () {
  _port=`ssh $_spin_fqdn cat /run/ports/shopify--$_service/svc/mysql`
  echo $_spin_fqdn:$_port
  mysql -u root -h $_spin_fqdn -P $_port
}
