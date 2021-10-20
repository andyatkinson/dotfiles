source ~/.bash/aliases
source ~/.bash/functions

# postgres.app CLI tools
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# if rbenv is present, configure it for use
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
