source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/domainavailable
source ~/.bash/functions
source ~/.localrc

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# if rbenv is present, configure it for use
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# make sure homebrew paths are first
export PATH=/usr/local/bin:$PATH

# http://mywiki.wooledge.org/BashFAQ/088
HISTFILESIZE=400000000
HISTSIZE=10000
PROMPT_COMMAND="history -a"
export HISTSIZE PROMPT_COMMAND
shopt -s histappend

# http://oinopa.com/2010/10/24/laptop-driven-development.html
export HISTIGNORE="fg*"
bind '"\C-f": "fg %-\n"'

# for golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export LESS="-r -n" # skip line numbers and do color output

# http://stackoverflow.com/a/791800/126688
stty -ixon
