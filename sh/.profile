# Greg Kikola
# ~/.profile

# Include ~/bin in PATH if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# Set default editors
if command -v vim >/dev/null 2>&1; then
  export SUDO_EDITOR="$(command -v vim)"
  export VISUAL="$(command -v vim)"
else
  export SUDO_EDITOR="$(command -v vi)"
  export VISUAL="$(command -v vi)"
fi
