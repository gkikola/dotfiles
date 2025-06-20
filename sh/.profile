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

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Load nvm completions if the current shell is Bash
if [ -n "$BASH_VERSION" ]; then
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
fi
