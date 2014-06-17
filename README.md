# dotfiles

This is how I set up my mac for development.

 * dotfiles (vim with Vundle-managed plugins, tmux, mysql, postgresql, etc.)
 * homebrew formulas (OS X packages)
 * [npm](https://npmjs.org/) (node packages)
 * OS X <a href='http://en.wikipedia.org/wiki/Defaults_(software)'>defaults</a>

The bash directory has various bash shell scripts and configuration.

## Installation
Clone this directory and run one or more of the following rake tasks.

``` bash
$ rake -T
rake dotfiles       # install the dotfiles into home directory
rake homebrew       # install homebrew formulas
rake npm            # install npm packages
rake os_x_defaults  # replace OS X defaults
```

## Extras

  * Download [Source Code Pro](https://github.com/adobe/source-code-pro) and set iTerm preferences to use it
  * [ansiweather](https://github.com/fcambus/ansiweather) should be cloned to `~/Projects` so that alias `weather` works. Configuration is done with the `ansiweatherrc` file.
  * [OS X shortcuts](http://mattgemmell.com/mac-keyboard-shortcuts/)

## OS X

  * Remap caps lock to control

## vim

``` bash
Ctrl-e # execute vim-sparkup
gf # jump to code under cursor, rails.vim adds more
jj # insert mode to normal mode
jjj # insert mode to normal mode and write buffer
leader-z # goyo writing mode
Ctrl-n # on top of a word, enable multiple cursors match
Ctrl-p # next match with multiple cursors, ctrl-x to skip a match
F8 # tagbar :TagbarToggle
Ctrl-c # in normal mode, writes to ~/.vimbuffer (copy and paste between instances)
Ctrl-v v # paste from ~/.vimbuffer
Ctrl-p # normal mode, CtrlP find
Ctrl-b # CtrlP MRU buffer list
Ctrl-f # CtrlP function matching
Ctrl-h/j/k/l # navigate between panes
Ctrl-^ # last buffer
leader-n # show file in nerdtree
Ctrl-p # insert mode, displays autocomplete suggestions
s # in nerdtree, "s" on a file opens it in a vertical split
i # in nerdtree, "i" opens in split
:A # rails.vim, open alternative file
:Rcontroller # rails.vim, open related controller
:Rails console # rails.vim, open a console
:Rlog # rails.vim, open rails log file in a split window
:ctags -R ! # generate tags file for project
leader-c # call ctags on project
Ctrl-] # navigate via tags to item under cursor
Ctrl-t # navigate back after jumping with ctags
:AV # rails.vim, edit the alternate file in a vertical split
dap # delete around paragraph
:ta # navigate list of tags
"*y # copy to OS X clipboard
Ctrl-v # in ctrlp buffer list, open buffer in vertical split
Ctrl-x # in ctrlp buffer list, open buffer in split
leader-w # write buffer
leader-q # quit buffer
^ # jump to first character of line
leader-s # toggle spellchecking
Ctrl-w # toggle panes
gU # make uppercase, plus motion (w, k etc.)
~ # swap case
Ctrl-o # jump back
Ctrl-i # jump forward
nG # jump to line n
Ctrl-u # in insert mode, delete line before cursor
Ctrl-w # in insert mode, delete word before cursor
Ctrl-w H/J/K/L # re-configure split panes, cycle the splits layout
leader-p F5 # refresh ctrlp buffer list
:30winc > # add 30 characters of width to vertical split
v # with ack.vim, browsing results, "v" to open result in vertical split
Ctrl-w _ # maximize a pane vertically
Ctrl-w | # maximize a pane horizontally
Ctrl-w = # make the pane sizes equal
ctrl-w = # resize all panes
leader-t # with vimux and turbux, run test in tmux pane
leader-T # run focused unit test in tmux pane with vimux and turbux
:vs # # open the last buffer in a vertical split
- # first non-blank character previous line
_ # first non-blank character current line
Ctrl-w r # rotate split panes
daw # delete around word
fx # jump to first x, ; char repeats motion
i and a # text objects, select inside, or select everything including delimiter, e.g. cit
is # inside sentence
ip # inside paragraph
t{char} # before the char, f{char} puts cursor on the char
mm # set a mark, with char m, m{a-zA-Z}
`m # jump to mark m
`. # last change
g; # similar to `., can be repeated
`< # and `> start and end of last visual selection
dd # cut the current line, ddp to transpose current next lines
yyp # yank yank paste, duplicates line
Ctrl-r{register} # e.g. Ctrl-r" or C-r0
"+p # put from the Plus register, to avoid toggling paste option
C-\s # on top of a method, cscope query, to find caller of a method
:so ~/.vimrc # reload the ~/.vimrc
visual selection + S (capital "s") # type HTML tag like <p> to surround visual selection in <p> tag, depends on surround.vim
```

## bash

``` bash
Ctrl-u # delete line
Ctrl-y # restore before delete
Ctrl-a # move cursor, front of line
Ctrl-e # move cursor, end of line
Esc-b  # move cursor, back one word
Esc-f  # move cursor, forward one word
Ctrl-w # delete one word
option-b # back one word
option-f # forward one word
jobs # list jobs
jobs -p # list backgrounded jobs process IDs
fg 1 # bring background job 1 to the foreground
```

## Google Chrome

  * [Chrome keyboard shortcuts](https://developers.google.com/chrome-developer-tools/docs/shortcuts)

``` bash
cmd-option-i # toggle web inspector
option-command-u # open page source
```

## iTerm

  * Use Source Code Pro font
  * Profile > Keys > Left option key acts as "+Esc"

``` bash
Cmd-/ # show cursor
Cmd-shift-d # split the window horizontally
Cmd-option-arrow # move between the split panes
```

## tmux

``` bash
reset # reset, useful when text stops showing up
tmux attach-session -t 0 # attach to session 0
mux commands # tmuxinator commands list
mux list # tmuxinator list
ctrl-b space # switch to next tmux pane layout
```

## snippets

Snippets directory ~/.vim/bundle/vim-snippets/snippets

``` bash
=<tab> # puts in Erb expression tags (requires snipmate)
%<tab> # puts in Erb expression tags (requires snipmate)
def<tab> # start a ruby method
div # can use this for markup too
```

## tig

``` bash
git log | tig
git diff master | tig
```
