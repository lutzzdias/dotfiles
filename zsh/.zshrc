# Remove last login msg
clear

export EDITOR='nvim'

# Aliases
alias cls='clear'
alias ls='eza'
alias vim='nvim'

alias python='pypy3'
alias pip='pip3'

# Environment variables
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"           # starship
export RUSTUP_HOME="$HOME/.config/rustup"                               # rustup
export CARGO_HOME="$HOME/.config/cargo"                                 # cargo
export PYTHONSTARTUP="$HOME/.config/python/python.rc"                   # python
export PUB_CACHE="$HOME/.cache/pub"                                     # dart
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npm.rc"                 # npm
export PNPM_HOME="$HOME/Library/pnpm"                                   # pnpm
export NBRC_PATH="$HOME/.config/nb/nb.rc"                               # nb
export TASKRC="$HOME/.config/task/task.rc"                              # taskwarrior


# export JAVA_HOME="/usr/libexec/java_home"

# Paths
export PATH="/usr/bin/java${PATH+:$PATH}"                               # java
export PATH="/opt/flutter/bin${PATH+:$PATH}"                            # flutter
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"        # brew
export PATH="$HOME/Library/pnpm${PATH+:$PATH}"                          # pnpm

# Brew copletions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

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

