function my_git_prompt() {
  tester=$(git rev-parse --git-dir 2> /dev/null) || return

  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(my_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function my_current_branch() {
  echo $(current_branch || echo "(no branch)")
}

function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$fg_bold[red]%}(ssh) "
  fi
}

local ret_status="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})%?%{$reset_color%}"
PROMPT=$'$(ssh_connection)%{$fg_bold[green]%}%n@%m%{$reset_color%} (%{$fg_bold[blue]%}%~%{$reset_color%}) $(my_git_prompt)\n[${ret_status}] %# '
RPROMPT='%F{green}%D{%H:%M}%{$reset_color%}'

ZSH_THEME_PROMPT_RETURNCODE_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_PREFIX="<%{$fg_bold[yellow]%}"
#ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[magenta]%}^"
#ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}@"
#ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[red]%}@"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[white]%}@"
#ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}@"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}>"
