# Basics
export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='firefox'
export TERM='xterm-256color'

# Not case sensitive tab
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Aliases
alias pac='sudo pacman'
alias wal='feh --no-fehbg --bg-fill --randomize ~/Media/wallpapers/'
alias cls='clear'
alias loc='plocate -i'
alias mutt='neomutt'
alias b='brightnessctl s'
alias g++='g++ -Wall -pedantic -std=c++1 -g'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gps='git push'
alias gpl='git pull'

# Prompt
PROMPT='%F{blue}%1/%f %F{cyan} %f'

# Git Prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{red}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# Flutter
export PATH="$PATH:/home/lutz/Dev/flutter/bin"

# Android Studio
export _JAVA_AWT_WM_NONREPARENTING=1
