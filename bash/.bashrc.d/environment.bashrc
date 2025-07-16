# vim: filetype=sh

# Set TTY device for gpg-agent, if not already set by the system config
if [ -n "$GPG_TTY" ]; then
  GPG_TTY=$(tty)
  export GPG_TTY
fi
