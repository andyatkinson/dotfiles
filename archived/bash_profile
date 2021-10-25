source ~/.bash/aliases
source ~/.bash/functions
source ~/.bash/paths
source ~/.localrc

# if rbenv is present, configure it for use
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pyenv
eval "$(pyenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# make sure homebrew paths are first
export PATH=/usr/local/bin:$PATH

# http://mywiki.wooledge.org/BashFAQ/088
# 2021 - This is only for bash
HISTFILESIZE=400000000
HISTSIZE=10000
PROMPT_COMMAND="history -a"
export HISTSIZE PROMPT_COMMAND
shopt -s histappend

# http://oinopa.com/2010/10/24/laptop-driven-development.html
export HISTIGNORE="fg*"
bind '"\C-f": "fg %-\n"'

export LESS="-r -n" # skip line numbers and do color output

# http://stackoverflow.com/a/791800/126688
stty -ixon

# postgres.app CLI tools
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home/

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
export PATH="/usr/local/opt/openssl/bin:$PATH"
