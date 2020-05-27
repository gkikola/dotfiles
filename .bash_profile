# Greg Kikola
# ~/.bash_profile
# Created 2018-10-28
# Updated 2020-05-27

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

# include ~/bin in PATH if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

export PATH
