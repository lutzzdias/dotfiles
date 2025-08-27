# Remove last login msg
clear

# Brew completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

export EDITOR='nvim'

# Aliases
alias ls='eza'
alias flutter='fvm flutter'

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

