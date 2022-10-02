# Greg Kikola
# ~/.bashrc

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# Execute files in .bashrc.d
if [ -d "$HOME/.bashrc.d" ]; then
  for file in ~/.bashrc.d/*.bashrc; do
    . "$file"
  done
fi
