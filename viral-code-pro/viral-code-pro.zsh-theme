# vim:ft=zsh ts=2 sw=2 sts=2

# viral-code-pro

function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    local EXIT_CODE_PROMPT=''
    EXIT_CODE_PROMPT+="%{$fg[red]%}[%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg_bold[red]%}⮑ %{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg_bold[red]%}$LAST_EXIT_CODE%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg[red]%}-] %{$reset_color%}"
    echo "$EXIT_CODE_PROMPT"
  else
  	local EXIT_CODE_PROMPT=''
    EXIT_CODE_PROMPT+="%{$fg[green]%}[%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg_bold[green]%}⮑ %{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg[green]%}+%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg_bold[green]%}挢%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg[green]%}+] %{$reset_color%}"
    echo "$EXIT_CODE_PROMPT"
  fi
}

PROMPT='%{$fg_bold[blue]%}🗲  %{$reset_color%}%{$fg_bold[yellow]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
%{$fg_bold[red]%}${USER}@${HOST} %{$fg_bold[blue]%}❯%{$reset_color%} '

RPROMPT='$(check_last_exit_code)'

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%} ⇄ %{$reset_color%}%{$fg[magenta]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="•%{$fg_bold[red]%}✗%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="•%{$fg_bold[yellow]%}↷"
ZSH_THEME_GIT_PROMPT_CLEAN="•%{$fg_bold[green]%}✔"