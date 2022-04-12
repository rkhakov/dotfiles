if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    gitignore
    fzf
    docker
    docker-compose
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey '^ ' autosuggest-accept

# ZSH Config
CASE_SENSITIVE="true"
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS
unsetopt correct  # disable auto correct

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export EDITOR='vim'

# Aliases
alias reload!=". ~/.zshrc"
alias ls="exa -b --git --icons --group-directories-first"
alias ll="ls -lah"
# Git aliases
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'
alias gac="git add -A && git commit"
alias gacm="git add -A && git commit -m"

# Local config that shouldn't be in the repository
if [ -f $HOME/.localrc ]; then source $HOME/.localrc; fi

# The next line updates PATH for Yandex Cloud CLI.
if [ -f $HOME/yandex-cloud/path.bash.inc ]; then source $HOME/yandex-cloud/path.bash.inc; fi

# The next line enables shell command completion for yc.
if [ -f $HOME/yandex-cloud/completion.zsh.inc ]; then source $HOME/yandex-cloud/completion.zsh.inc; fi

