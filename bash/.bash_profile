# Greg Kikola
# ~/.bash_profile

# Execute .profile if it exists
if [ -f "$HOME/.profile" ]; then
  . "$HOME/.profile"
fi

# Execute .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi
