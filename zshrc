# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# All this for a prompt!
CHEVRON_SYMBOL=$'\ue0b0'

chevron() {
    local from_colour="${1}"
    local to_colour="${2}"

    print -n "%{$fg[$from_colour]%}"
    print -n "%{$bg[$to_colour]%}"
    print -n $CHEVRON_SYMBOL
    print -n "%{$fg[$to_colour]%}"
}

local ret_status_colours="%(?:%{$bg[blue]%}:%{$bg[red]%})"

local ret_status_ok="%{$bg[blue]%}  $(chevron blue cyan)"
local ret_status_bad="%{$bg[red]%}  $(chevron red cyan)"
local ret_status="%(?:${ret_status_ok}:${ret_status_bad})"
local username="%{$fg[black]%} %n $(chevron cyan blue)"
local cwd="%{$fg[black]%} %~ %{$fg[blue]%}%{$bg[black]%}$CHEVRON_SYMBOL%{$reset_color%}"

PROMPT='${ret_status}${username}$cwd $(git_prompt_info)
$ '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
