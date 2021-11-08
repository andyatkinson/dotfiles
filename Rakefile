require 'rake'

desc "install the dotfiles into home directory"
task :dotfiles do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[archived Rakefile README.md config.fish].include?(file)

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

  link_fish_config
  link_jrnl_config
end

desc "replace OS X defaults"
task :os_x_defaults do
  # thanks! https://gist.github.com/saetia/1623487
  # Fonts
  # Set a shorter Delay until key repeat
  system %Q{defaults write NSGlobalDomain InitialKeyRepeat -int 12}

  puts "changing key repeat rate. normal minimum is 2 (30ms). Set to 0, 1, or 2."
  # Set a blazingly fast keyboard repeat rate
  system %Q{defaults write NSGlobalDomain KeyRepeat -int 1}
  # system %Q{defaults write -g KeyRepeat -int 0}

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

  puts "allow key repeat in intellij idea editor"
  system %Q{defaults write com.jetbrains.intellij ApplePressAndHoldEnabled -bool false}

  # Fixing blurry fonts https://www.cleverfiles.com/help/mac-fonts-text-blurry.html
  # I thought "3" looked the best between disabled completely and the max value.
  # Particularly noticed in the OS top left area fonts on a LG 32" 4K monitor.
  # Would still prefer it to be more crisp but this is not a Retina display
  puts "Disable font smoothing - maybe in Mac OS Big Sur"
  #system %Q{defaults -currentHost write -g AppleFontSmoothing -int 0}
  system %Q{defaults -currentHost write -g AppleFontSmoothing -int 3}


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

def link_fish_config
  local_config = "config.fish"
  fish_config = File.join(ENV['HOME'], ".config", "fish", "config.fish")
  puts "linking #{fish_config}"
  system %Q{ln -sf "$PWD/#{local_config}" #{fish_config}}
end

def link_jrnl_config
  local_config = "jrnl.yaml"
  jrnl_config = File.join(ENV['HOME'], ".config", "jrnl", "jrnl.yaml")
  puts "linking #{jrnl_config}"
  system %Q{ln -sf "$PWD/#{local_config}" #{jrnl_config}}
end
