# Greg Kikola
#
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
#
# Created 2020-05-27

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
	  . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# set default editor to emacs if it exists
if command -v emacs >/dev/null 2>&1; then
  export EDITOR=$(command -v emacs)\ -nw
  export VISUAL=$(command -v emacs)
fi

export PATH="$HOME/.cargo/bin:$PATH"
