# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=* r:|=*'
zstyle :compinstall filename '/home/liange/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

PS1="%{[01;33m%}%n@%m %{[01;32m%}%~%{[0m%}%# "
alias ls='ls -aF --color=auto'
alias fgrep='fgrep --color=auto --exclude-dir=".svn"'
alias egrep='egrep --color=auto --exclude-dir=".svn"'
alias grep='grep --color=auto --exclude-dir=".svn"'

bindkey ${terminfo[khome]} beginning-of-line
bindkey ${terminfo[kend]} end-of-line
bindkey ${terminfo[kdch1]} delete-char
bindkey ${terminfo[kich1]} overwrite-mode
