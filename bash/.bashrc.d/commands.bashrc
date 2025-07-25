# vim: filetype=sh

# Run gvim without GUI instead of Vim in order to have clipboard support
if command -v gvim >/dev/null 2>&1; then
  alias vim='gvim -v'
  alias vimdiff='gvimdiff -v'
  alias view='gview -v'
fi

# Set ls aliases
alias ll='ls -hl' # Long list format with human-readable sizes
alias la='ls -A' # Show all files (excluding implied . and ..)
alias lla='ls -Ahl' # Long list format with all files
