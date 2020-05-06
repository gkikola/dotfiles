# Greg Kikola (-*- Sh -*-)
# ~/.bash_aliases
# 2018-09-19
# Updated 2020-05-05

# directories
alias dl='cd ~/Downloads/'

# ls aliases
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -Al'

# tar
alias untar='tar xvf'
alias untargz='tar xvzf'
alias untarbz2='tar xvjf'

# other handy arguments
alias wget='wget -c'

# working with the X clipboard
if which xclip; then
  alias xclip='xclip -selection clipboard'
fi
