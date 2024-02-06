
# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# Environment variables
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"           # starship
export RUSTUP_HOME="$HOME/.config/rustup"                               # rustup
export CARGO_HOME="$HOME/.config/cargo"                                 # cargo
export PYTHONSTARTUP="$HOME/.config/python/python.rc"                   # python
export PUB_CACHE="$HOME/.cache/pub"                                     # dart
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npm.rc"                 # npm
export PNPM_HOME="$HOME/Library/pnpm"                                   # pnpm
export BARTIB_FILE="/Users/lutz/.local/share/bartib/data.bartib"

# Paths
export PATH="/usr/bin/java${PATH+:$PATH}"                               # java
export PATH="/opt/flutter/bin${PATH+:$PATH}"                            # flutter
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"        # brew
export PATH="$HOME/Library/pnpm${PATH+:$PATH}"                          # pnpm

# Misc
. "$HOME/.cargo/env"
. "/Users/lutz/.config/cargo/env"
