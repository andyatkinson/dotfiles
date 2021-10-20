source ~/.bash/aliases

# TODO these need to be adjusted to work with fish shell
#source ~/.bash/functions

set -g CDPATH ~/Projects:~/Dropbox

# rbenv support fish shell
# https://github.com/rbenv/rbenv/issues/195
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH

rbenv rehash >/dev/null 2>&1

# postgres.app CLI tools
fish_add_path /Applications/Postgres.app/Contents/Versions/latest/bin
