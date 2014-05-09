require 'rake'

desc "install the dotfiles into home directory"
task :dotfiles do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.md shortcuts.md].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
end


desc "install homebrew formulas"
task :homebrew do
  # this acts as a list of the packages I always use
  #
  # manual: wkhtmltopdf, qt, postgres, redis
  #
  %w(wget git mysql imagemagick ack proctools fortune htop watch lynx 
     gcal tmux macvim reattach-to-user-namespace bash-completion ctags
     dos2unix jq mplayer rbenv tree markdown gpg node tig hg).each do |formula_name|
    system "brew install #{formula_name}"
  end
end

desc "install npm packages"
task :npm do
  # should add /usr/local/bin/coffee
  npm_packages = %w[ coffee-script grunt grunt-cli grunt-ember-templates ]
  npm_packages.each do |package|
    system "npm install -g #{package}"
  end
end

desc "replace OS X defaults"
task :os_x_defaults do
  # thanks! https://gist.github.com/saetia/1623487
  puts "changing delay value before key repeat. normal minimum is 15 (225ms)"
  system %Q{defaults write -g InitialKeyRepeat -int 15}

  puts "changing key repeat rate. normal minimum is 2 (30ms). Set to 0, 1, or 2."
  system %Q{defaults write -g KeyRepeat -int 1}

  puts "disable sound effect when changing volume. Requires log-out/log-in to take effect."
  system %Q{defaults write -g com.apple.sound.beep.feedback -integer 0}

  puts "Show path bar in finder"
  system %Q{defaults write com.apple.finder ShowPathbar -bool true}

  puts "enable safari developer menu, debugger, etc."
  system %Q{defaults write com.apple.Safari IncludeInternalDebugMenu -bool true}
  system %Q{defaults write com.apple.Safari IncludeDevelopMenu -bool true &&
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true &&
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true &&
  defaults write NSGlobalDomain WebKitDeveloperExtras -bool true}

  puts "show the ~/Library folder"
  system %Q{chflags nohidden ~/Library}

  puts "show the absolute path in Finders title bar"
  system %Q{defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES}
end


private
  def replace_file(file)
    system %Q{rm "$HOME/.#{file}"}
    link_file(file)
  end

  def link_file(file)
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
