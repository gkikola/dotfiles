# Greg Kikola
# ~/.bashrc
# 2018-09-19
# Modified 2022-09-01

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# History length
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

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

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
  PS1="\[\e]0;\u@\h:\w\a\]$PS1"
  ;;
*)
  ;;
esac

# Enable color support of ls and grep by default
# Make sure ls groups directories first
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
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

# Default editors
export SUDO_EDITOR=vim
export VISUAL=vim

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# less and man should not clear screen upon exit
export LESS='-RX'

# Alias definitions: Load from ~/.bash_aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
