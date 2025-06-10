# vim: filetype=sh

# Run gvim without GUI instead of Vim in order to have clipboard support
alias vim='gvim -v'

# Set ls aliases
alias ll='ls -hl' # Long list format with human-readable sizes
alias la='ls -A' # Show all files (excluding implied . and ..)
alias lla='ls -Ahl' # Long list format with all files

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
