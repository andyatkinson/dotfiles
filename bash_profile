source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/domainavailable
source ~/.bash/functions

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.workrc ]; then
  . ~/.workrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

eval "$(rbenv init -)"

export PATH="$HOME/.rbenv/bin:$PATH"
