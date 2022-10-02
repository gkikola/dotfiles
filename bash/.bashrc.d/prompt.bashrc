# vim: filetype=sh

# Set a color prompt if supported
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  color_prompt=yes
else
  color_prompt=
fi

if [ "$color_prompt" = yes ]; then
  PS1='[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\$ '
else
  PS1='[\u@\h:\w]\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm then set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
  PS1="\[\e]0;\u@\h:\w\a\]$PS1"
  ;;
*)
  ;;
esac
