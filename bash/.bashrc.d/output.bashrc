# vim: filetype=sh

# Enable color support for ls and grep by default
# Also sort directories first in ls output
if [ -x /usr/bin/dircolors ]; then
  if [ -r ~/.dircolors ]; then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(dircolors -b)"
  fi

  alias ls='ls --color=auto --group-directories-first'
  alias dir='dir --color=auto --group-directories-first'
  alias vdir='vdir --color=auto --group-directories-first'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
else
  alias ls='ls --group-directories-first'
  alias dir='dir --group-directories-first'
  alias vdir='vdir --group-directories-first'
fi

# Set color output for GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Do not clear screen when less (or man) exits
export LESS='-RX'
