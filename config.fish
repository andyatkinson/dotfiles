set -g CDPATH . ~/Projects ~/Dropbox

set -g JAVA_HOME (/usr/libexec/java_home)

set -U fish_user_paths /opt/homebrew/bin $fish_user_paths

# rbenv installed via homebrew
# Load rbenv automatically by appending
# the following to ~/.config/fish/config.fish:
status --is-interactive; and rbenv init - fish | source

# postgres.app CLI tools
fish_add_path /Applications/Postgres.app/Contents/Versions/latest/bin

# Java
fish_add_path (/usr/libexec/java_home)

# Set the colors of directories and files https://stackoverflow.com/a/25563976
set -Ux LSCOLORS gxBxhxDxfxhxhxhxhxcxcx

# Set Editor
set -Ux EDITOR vim

### Aliases https://stackoverflow.com/a/2763014
alias b "bundle"
alias c "clear"
alias d "cd ~/Projects/dotfiles && vim ."
alias g "git"
alias p "cd ~/Projects && ls"
alias t "tmux"
alias u "cd .."
alias v "vim ."

# ls
alias ls "ls -laAFGh"
alias ll "ls -l"
alias la 'ls -A'

# git
alias gl "git pull"
alias glr "git pull --rebase"
alias gp 'git push'
alias gpom 'git push origin master'
alias gphm 'git push heroku master'
alias gpoh 'git push origin head'
alias gpohm 'git push origin master && git push heroku master'
alias gc 'git commit'
alias gcam 'git commit --all -m'
alias gcm 'git checkout master'
alias gco 'git checkout'
alias gb 'git branch'
alias gbd 'git branch -d'
alias gs 'git status'
alias grp 'git remote prune origin'
alias gls 'git log --stat'
alias gwtf "git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname)' | cut -d / -f 3-"
alias gca "git commit --amend"
alias gra "git rebase --abort"
alias grc "git rebase --continue"
alias gmc "git merge --continue"

# git diff
alias gd "git diff"
alias gds "git diff --staged"
alias gdh "git diff HEAD" # diff the unstaged changes
alias gdm "git diff master"
alias gdms "git diff master --stat"
alias gdmss "git diff master --shortstat"

# tmux
alias tls "tmux ls"

alias gbo "gh browse -b (git branch --show-current)"

##### FUNCTIONS #####


### Mac OS hipster
function hipster
  cat /System/Library/PrivateFrameworks/NotesShared.framework/Versions/A/Resources/Hipster.words | sed 's/ /\n/g' | sort -R | head -n1
end

## Database functions
function columns
  psql --dbname $argv[1] "select column_name from information_schema.columns where table_name = \'$argv[2]\';";
end

function tables
  psql --dbname $argv -c "SELECT tablename FROM pg_catalog.pg_tables where schemaname = 'public';";
end

function kill_all_jobs
  jobs -p | sudo xargs kill -9
end

## Credit: https://github.com/fish-shell/fish-shell/issues/8604#issuecomment-1169638533
## Remove from path
## Use fish_add_path to add, or this function to remove entries
## e.g.
# After upgrading Postgres, I removed this version-specific /bin path from $PATH
# `remove_path /Applications/Postgres.app/Contents/Versions/15/bin`
#
function remove_path
  if set -l index (contains -i "$argv" $fish_user_paths)
    set -e fish_user_paths[$index]
    echo "Removed $argv from the path"
  end
end

set -gx PATH $HOME/.asdf/shims $PATH

status --is-interactive; and rbenv init - fish | source

fish_add_path ~/.pgenv/bin
fish_add_path ~/.pgenv/pgsql/bin

function kill_puma
  ps -ef |grep puma | grep -v grep |  awk '{print $2}' | sudo xargs kill -9
end

function trim
  sed -i '' -e :a -e '/^\n*$/{$d;N;ba' -e '}' db/structure.sql
end

function git-dir-dates
  for dir in */
    set last_commit_date (git log -1 --format="%ci" -- $dir ^/dev/null)
    if test -n "$last_commit_date"
      echo "$last_commit_date  $dir"
    end
  end | sort -r
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/andy/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/andy/Downloads/google-cloud-sdk/path.fish.inc'; end

# Created by `pipx` on 2024-09-13 19:54:19
set PATH $PATH /Users/andy/.local/bin

# Run from branch with db/structure.sql conflicts
function recommit_structure
  git co develop
  git pull origin develop
  git co -
  git checkout develop -- db/structure.sql
  git commit -m "Reset file"
  git merge --no-edit develop
  git rebase develop --interactive
end
