# dotfiles

This is how I set up my mac for development. Primarily Ruby on Rails web development. Other environments that are supported are Python, Node, Go.

 * dotfiles (vim with plugins, tmux, mysql, postgresql, etc.)
 * bash, iTerm, tmux, installed tmux plugin manager manually
 * homebrew formulas in `Brewfile`
 * Node installed from their website
 * PostgreSQL installed as [Postgres.app](https://postgresapp.com)
 * [npm](https://npmjs.org/) (node packages)
 * OS X <a href='http://en.wikipedia.org/wiki/Defaults_(software)'>defaults</a>. Customize OS X.
 * gems that are used system wide, are in `gems`

The bash directory has various bash shell scripts and configuration. Make sure to install the dotfiles.

`xcode-select --install` will need to be run manually before any gem native extensions can be built, for example, the Nokogiri gem.


## Installation

Clone this directory and run one or more of the following rake tasks.

Install Vundle. [instructions](https://github.com/gmarik/Vundle.vim)

To reinstall vim plugins, delete `~/.vim/bundle` and clone vundle, then run `vim +PluginInstall +qall` on the command line.

```sh
$ rake -T
rake dotfiles       # install the dotfiles into home directory
rake npm            # install npm packages
rake os_x_defaults  # replace OS X defaults
```

Note: `brew bundle` has been deprecated. For now the `Brewfile` serves as a list of packages.

## Release notes

2017-03-24
`:PluginUpdate` was run to update all plugins. Should convert this setup to native plugin management soon.

2015-04-28

Switch from git bash completion script to a homebrew version

2016-03-01

Link homebrew openssl explicitly on El Capitan OS X, before installing the eventmachine 1.0.5
<https://github.com/eventmachine/eventmachine/issues/602>

Puma 2.9.1 (specify opt-dir or can configure bundler)
<https://github.com/puma/puma/issues/783>
`gem install puma -v '2.9.1' -- --with-opt-dir=/usr/local/opt/openssl`


## Extras

  * Download [Source Code Pro](https://github.com/adobe/source-code-pro) and set iTerm preferences to use it
  * [ansiweather](https://github.com/fcambus/ansiweather) should be cloned to `~/Projects` so that alias `weather` works. Configuration is done with the `ansiweatherrc` file.
  * [OS X shortcuts](http://mattgemmell.com/mac-keyboard-shortcuts/)
  * [Sequel Pro](http://www.sequelpro.com/)
  * [PG Commander](https://eggerapps.at/pgcommander/)

## OS X

  * Remap caps lock to control

| Command      | Description |
| ----------- | ----------- |
|  softwareupdate --list     | find available things to install |
|  softwareupdate --install <product name> |  update the software you named |
| ctrl-arrow key  | ctrl-arrow key |
| command-alt-h | hide other applications' windows, alt is fn+opt |

## vim

Interesting help:
`:help opening-window`


| Command      | Description |
| ----------- | ----------- |
| de | delete to the end of the current word, INCLUDING the last character |
| ce | change until the end of word |
| 2dd | delete 2 lines |
| % | place cursor on character like `(` and press `%` to find match |
| "_d | black hole register, e.g. "_dw to delete a word without storing the result in a register |
| Ctrl-e      | execute vim-sparkup       |
| gf | jump to code under cursor, rails.vim adds more
| jj | insert mode to normal mode
| jjj | insert mode to normal mode and write buffer
| leader-z | goyo writing mode
| Ctrl-n | on top of a word, enable multiple cursors match
| Ctrl-p | next match with multiple cursors, ctrl-x to skip a match
| F8 | tagbar :TagbarToggle
| Ctrl-c | in normal mode, writes to ~/.vimbuffer (copy and paste between instances)
| Ctrl-v v | paste from ~/.vimbuffer
| Ctrl-p | normal mode, CtrlP find
| Ctrl-b | CtrlP MRU buffer list
| Ctrl-f | CtrlP function matching
| Ctrl-h/j/k/l | navigate between panes
| Ctrl-^ | last buffer
| leader-n | show file in nerdtree
| Ctrl-p | insert mode, displays autocomplete suggestions
| s | in nerdtree, "s" on a file opens it in a vertical split
| i | in nerdtree, "i" opens in split
| :A | rails.vim, open alternative file
| :Rcontroller | rails.vim, open related controller
| :Rails console | rails.vim, open a console
| :Rlog | rails.vim, open rails log file in a split window
| :ctags -R ! | generate tags file for project
| leader-c | call ctags on project
| Ctrl-] | navigate via tags to item under cursor
| Ctrl-t | navigate back after jumping with ctags
| :AV | rails.vim, edit the alternate file in a vertical split
| dap | delete around paragraph
| :ta | navigate list of tags
| "*y | copy to OS X clipboard
| Ctrl-v | in ctrlp buffer list, open buffer in vertical split
| Ctrl-x | in ctrlp buffer list, open buffer in split
| leader-w | write buffer
| leader-q | quit buffer
| ^ | jump to first character of line
| leader-s | toggle spellchecking
| Ctrl-w | toggle panes
| gU | make uppercase, plus motion (w, k etc.)
| ~ | swap case
| Ctrl-o | jump back
| Ctrl-i | jump forward
| nG | jump to line n
| Ctrl-u | in insert mode, delete line before cursor
| Ctrl-w | in insert mode, delete word before cursor
| Ctrl-w H/J/K/L | re-configure split panes, cycle the splits layout
| leader-p F5 | refresh ctrlp buffer list
| :30winc > | add 30 characters of width to vertical split
| v | with ack.vim, browsing results, "v" to open result in vertical split
| Ctrl-w _ | maximize a pane vertically
| Ctrl-w | | maximize a pane horizontally
| Ctrl-w = | make the pane sizes equal
| ctrl-w = | resize all panes
| leader-t | with vimux and turbux, run test in tmux pane
| leader-T | run focused unit test in tmux pane with vimux and turbux
| :vs | open the last buffer in a vertical split
| - | first non-blank character previous line
| _ | first non-blank character current line
| Ctrl-w r | rotate/swap/cycle/switch split panes
| daw | delete around word
| fx | jump to first x, ; char repeats motion
| i and a | text objects, select inside, or select everything including delimiter, e.g. cit
| is | inside sentence
| ip | inside paragraph
| t{char} | before the char, f{char} puts cursor on the char
| mm | set a mark, with char m, m{a-zA-Z}
| `m | jump to mark m
| `. | last change
| g; | similar to `., can be repeated
| `< | and `> start and end of last visual selection
| dd | cut the current line, ddp to transpose current next lines
| yyp | yank yank paste, duplicates line
| Ctrl-r{register} | e.g. Ctrl-r" or C-r0
| "+p | put from the Plus register, to avoid toggling paste option
| C-\s | on top of a method, cscope query, to find caller of a method
| :so ~/.vimrc | reload the ~/.vimrc
| visual selection + S (capital "s") | type HTML tag like <p> to surround visual selection in <p> tag, depends on surround.vim
| ctrl-r " | paste from insert mode
| d/ | hit enter after typing the selection, delete until the selection
| f [space] | ";" will repeat the motion
| pry [tab] | in a ruby file, will insert a pry binding statement, part of the built-in ruby snippets file
| y$ | yank until the end of the line without the newline
| gui | switch to GUI
| redraw! | redraw the screen when it goes black <http://stackoverflow.com/a/1117742/126688>
| e %:h (tab) | expands current directory. supply filename to create a new file at that point on disk.
| cc | delete entire line and enter insert mode
| ciB | change inner block (inside of {} braces)
| comment out | ctrl-slash-slash
| pgrep -f | -f is to match against full argument list, typically need this for a backgrounded rails console process name
| ctrl-o-o | open last location <https://dev.to/jovica/3-little-known-but-useful-vim-tips-1pbg>

## Vundle

Clone Vundle.

```sh
:PluginInstall
```

## bash

| Command      | Description |
| ----------- | ----------- |
| ctrl-l | clear line
| Ctrl-u | cut line
| ctrl-y | paste line
| Ctrl-y | restore before delete
| Ctrl-a | move cursor, front of line
| Ctrl-e | move cursor, end of line
| Esc-b  | move cursor, back one word
| Esc-f  | move cursor, forward one word
| Ctrl-w | delete one word
| option-b | back one word (OS X?)
| option-f | forward one word (OS X?)
| jobs | list jobs
| jobs -p | list backgrounded jobs process IDs
| fg 1 | bring background job 1 to the foreground
| Ctrl-x Ctrl-e | edit command line command in $EDITOR
| less +F path/to/log | "follow" the log file, ctrl-c to go in to search mode, "F" to return to following

## Google Chrome

  * [Chrome keyboard shortcuts](https://developers.google.com/chrome-developer-tools/docs/shortcuts)

```sh
cmd-option-i # toggle web inspector
option-command-u # open page source
```

## iTerm

  * Use Source Code Pro font
  * Profile > Keys > Left option key acts as "+Esc"

```sh
Cmd-/ # show cursor
Cmd-shift-d # split the window horizontally
Cmd-option-arrow # move between the split panes
```

## tmux

```sh
tmux new-session -s dev_logs # start a new session named dev_logs
reset # reset, useful when text stops showing up
tmux attach-session -t 0 # attach to session 0
mux commands # tmuxinator commands list
mux list # tmuxinator list
ctrl-b space # switch to next tmux pane layout
leader + h # terminate a stuck SSH session
prefix + c # new window
prefix + , # rename a window
```

Tmux plugin manager (install this manually)
<https://github.com/tmux-plugins/tpm>

Inside of tmux, run `Prefix-I` (capital "I") to install plugins.

## snippets

Snippets directory `~/.vim/bundle/vim-snippets/snippets`

```sh
=<tab> # puts in Erb expression tags (requires snipmate)
%<tab> # puts in Erb expression tags (requires snipmate)
def<tab> # start a ruby method
div # can use this for markup too
```

## [tig](https://github.com/jonas/tig)

```sh
git log | tig
git diff master | tig
h # help
m # toggle main view (useful to jump back and forth between code details and commit titles)
```

## [ngrok](https://ngrok.com/)

```sh
ngrok start <server> # where <server> is defined in ~/.ngrok
ngrok 3000 # serve a rails app on the default port
ngrok -help
open http://localhost:4040 # real-time interface to inbound requests
```

Symlink the file in to the following location: `~/.ngrok2/ngrok.yml`

`ln -s "$PWD/ngrok.yml" "$HOME/.ngrok2/ngrok.yml"`

## [jrnl](http://maebert.github.io/jrnl/)

Default config file: `~/.config/jrnl/jrnl.yaml`

```sh
jrnl # enter compose mode
jrnl @tag # list entries that include tag
jrnl -n10 # list last 10 entries
jrnl --edit # edit old entries (unencrypted file)
```

## [spectacle](http://spectacleapp.com/)

```sh
option-command-right arrow # right half
option-command-f # full screen
```

## rbenv

Installed `rbenv` from GitHub, but then `brew install ruby-build` for the `rbenv install` command.

```sh
rbenv install -l # list installable versions
rbenv install 2.1.4 # install specific version
rbenv version
brew upgrade --HEAD ruby-build
rbenv versions # list installed rubies
```

## Slack

```sh
+:... # plus sign plus "colon" to pull up Emoji reactions, will react to most recent post
up arrow key # edit last message
Command-t # jump to another channel
Command-1/2/3... # Jump to multiple workspaces in OS X desktop client app
option-arrow up/down # move up/down between channels
command-left/right bracket # move between channels
/remind # create a reminder, type date and time naturally
/leave # leave a channel
/ # find out more slash options available
`` # or triple backticks code fence
```

## Microsoft Teams

[Keyboard Shortcuts for MS Teams](https://support.microsoft.com/en-us/office/keyboard-shortcuts-for-microsoft-teams-2e8e2a70-e8d8-4a19-949b-4c36dd5292d2?ui=en-us&rs=en-us&ad=us)

I use it on Mac OS but swap "command" for "control" on Windows.

```sh
command-shift-x # put focus on new message
command-enter  # send message
command-e # search bar on top
command-shift-m # mute/unmute microphone
command-shift-o # toggle video on/off
command-1/2/3 # navigate vertically between activity/chat/teams sections

option-arrow up/down # navigate items vertically under org
```

## Xcode and simulator

```sh
command-shift-o # fuzzy find files by name (open quickly), colon line number (e.g. ":42" to open line 42)
command-b # build
command-1 # etc. to resize the simulator
ctrl-command-left/right # move back and forth between windows
command-click # jump to method definition
ctrl-command-up # switch between header and implementation file
command-shift-j # show file in project navigator
```

## [Httpie](https://github.com/jakubroztocil/httpie)

* `tldr httpie` (or just use `curl`)

## [showterm](http://showterm.io/)

Terminal screencasting!

```sh
showterm [command]
```

## [lnav](http://lnav.org)

Fancy log file viewer with cool features: <http://lnav.org/features/>

```sh
brew install lnav
lnav path/to/log
? # help
```

```sh
Sidekiq.redis { |conn| conn.flushdb }
redis-cli flushdb # dump everything in redis
```

## IntelliJ OS X

IdeaVim action list: <https://gist.github.com/zchee/9c78f91cc5ad771c1f5d>

```sh
command-shift-t # jump to corresponding test
command-shift-a # action or option name
command-shift-a, type "select in project view" # view file in project view
command-shift-o # Enter file name
command-[ or command-] # jump backward and forward in history
:action Run # run the current file
:action "Split Vertically" # vertical split
<C-W> + h/j/k/l # move between splits
Ctrl + ww # switch between windows
command-shift-c # copy current filepath to clipboard
command+F12 # file structure popup
command+e # view recent files
ctrl-space # basic code completion
ctrl-shift-space # smart code completion
command-1 # show/hide project view
open -a "IntelliJ IDEA" # open application when running Docker
```

Plugin: Key Promoter

## MS Teams

## VS Code

- `Shift-command-V` opens preview but in same window
- `Command-K + V` opens side by side markdown preview for `.md` file
- Column selection: `shift-option` + mouse

## Zoom

```sh
command-shift-a # toggle audio
command-shift-v # toggle video
```

## Man pages

`tldr` as an improvement or supplement to `man`, with examples, e.g. `tldr curl`

## Maven

```sh
mvn -Dtest=com.andy.AwesomeTest test # run specific test
mvn clean compile exec:java # compile & boot app
```

## Go lang

```sh
gore # Go lang REPL
```

## Homebrew

* `brew list`
* `brew cask list` # OS X
* `brew deps --tree --installed`

## pyenv

* `pyenv versions`

## Windows

* Windows Terminal. `iTerm` like. `Ctrl-Tab` to switch between tabs.
* Use WSL 2. Requires a newer Windows build. This link helps debug Windows Update problems via log files and clears a cache. <https://www.howtogeek.com/416169/how-to-fix-what-needs-your-attention-windows-10-setup-errors/>
* My preference: Remap Caps to Ctrl. This can be done with Keyboard Manager in PowerToys.
* Currently using Ubuntu 18.04 with WSL 2
  * Use `wsl` commands `--set-version` to convert an existing distribution or `--set-default-version` for all new distributions
* Chrome with Vimium, AdBlock, 1Password

## MacDown

Markdown editor for OS X. Workaround for being a unidentified developer:
https://macdown.uranusjr.com/faq/#unidentified
