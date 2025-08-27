# Environment variables
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"                   # starship
export VOLTA_HOME="$HOME/.config/volta"						                    # volta (node versioning)
export RUSTUP_HOME="$HOME/.config/rust/rustup"						            # rustup
export CARGO_HOME="$HOME/.config/rust/cargo"						            # cargo
export GOPATH="$HOME/.config/go"						                        # go
export PYENV_ROOT="$HOME/.config/pyenv"                                         # pyenv
export DOCKER_CONFIG="$HOME/.config/docker"						                # docker
export FVM_CACHE_PATH="$HOME/.config/fvm"						                # fvm (flutter versioning)
export GEM_HOME="$HOME/.config/gem"						                        # ruby gems

# Path
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH" 			            # brew
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"                                  # ruby (overrides default macos version)
export PATH="$VOLTA_HOME/bin:$PATH"						                        # volta
export PATH="$CARGO_HOME/bin:$PATH"						                        # cargo
export PATH="$GOPATH/bin:$PATH"						                            # go
export PATH="$PYENV_ROOT/bin:$PATH"						                        # pyenv
export PATH="$FVM_CACHE_PATH/bin:$PATH"						                    # fvm (flutter versioning)
export PATH="$GEM_HOME/bin:$PATH"						                        # ruby gems
export PATH="$HOME/.luarocks/bin:$PATH"
