
# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# Environment variables
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"                   # starship
export RUSTUP_HOME="$HOME/.config/rustup"                                       # rustup
export CARGO_HOME="$HOME/.config/cargo"                                         # cargo
export PYTHONSTARTUP="$HOME/.config/python/python.rc"                           # python
export PUB_CACHE="$HOME/.cache/pub"                                             # dart
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npm.rc"                         # npm
export PNPM_HOME="$HOME/Library/pnpm"                                           # pnpm
export BARTIB_FILE="/Users/lutz/.local/share/bartib/data.bartib"                # bartib (time tracker)
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"    # dbus (zathura)

# Paths

# Tmux - conda path fix
if [ -x /usr/libexec/path_helper ]; then
        PATH="" # <- ADD THIS LINE (right before path_helper call)
        eval `/usr/libexec/path_helper -s`
fi

export PATH="/usr/bin/java${PATH+:$PATH}"                                       # java
export PATH="/opt/flutter/bin${PATH+:$PATH}"                                    # flutter
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"                # brew
export PATH="$HOME/Library/pnpm${PATH+:$PATH}"                                  # pnpm
export PATH="/opt/anaconda${PATH+:$PATH}"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
