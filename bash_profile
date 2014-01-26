source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/domainavailable
source ~/.bash/functions

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# https://github.com/sstephenson/rbenv/issues/369
# Mac OS X uses path_helper to preload PATH, clear it out first
if [ -x /usr/libexec/path_helper ]; then
  PATH=''
  eval `/usr/libexec/path_helper -s`
fi

# if rbenv is present, configure it for use
if which rbenv &> /dev/null; then
  # Put the rbenv entry at the front of the line
  export PATH="$HOME/.rbenv/bin:$PATH"

  # enable shims and auto-completion
  eval "$(rbenv init -)"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

