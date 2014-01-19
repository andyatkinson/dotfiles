# dotfiles

This is how I set up my mac for development.

 * dotfiles (vim with Vundle-managed plugins, tmux, mysql, postgresql, etc.)
 * homebrew formulas (OS X packages)
 * [npm](https://npmjs.org/) (node packages)
 * OS X [defaults](http://en.wikipedia.org/wiki/Defaults_(software) (user preferences plist files)

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

## OS X

  * Remap caps lock to control

## iTerm

  * Use Source Code Pro font
  * Profile > Keys > Left option key acts as "+Esc"
