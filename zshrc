# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# https://github.com/ohmyzsh/ohmyzsh/issues/6835#issuecomment-390216875
ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

local ret_status_ok="%{$fg[green]%} ✔"
local ret_status_bad="%{$fg[red]%} ✗"
local ret_status="%(?:${ret_status_ok}:${ret_status_bad})"
local cwd="%{$fg[green]%} [%~] %{$reset_color%}"

PROMPT='${ret_status} $cwd $(git_prompt_info)
$ '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

export EDITOR=nvim

# Any local machine stuff put in ~/.zshrc-local
if [[ -a ~/.local-zshrc ]]
then
    source ~/.local-zshrc
fi
