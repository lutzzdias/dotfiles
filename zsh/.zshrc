# Remove last login msg
clear

# Brew completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

export EDITOR='nvim'

# Aliases
alias ls='eza'

# init starship
eval "$(starship init zsh)"

# Case insensitive tab
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# pure prompt
# PROMPT='%F{blue}%1/%f %F{cyan}%f '

# Git prompt
# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# RPROMPT=\$vcs_info_msg_0_
# zstyle ':vcs_info:git:*' formats '%F{red}(%b)%r%f'
# zstyle ':vcs_info:*' enable git

