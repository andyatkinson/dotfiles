require 'rake'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README LICENSE].include? file
    
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
task :install_formulas do
  # assumes homebrew is installed, if installation fails
  # this acts as a list of the packages I always use
  #
  # manual: wkhtmltopdf, qt, postgres, node, redis
  #
  %w(wget git mysql imagemagick ack proctools fortune htop watch lynx gcal tmux macvim reattach-to-user-namespace bash-completion ctags dos2unix jq mplayer rbenv).each do |formula_name|
    system "brew install #{package_name}"
  end
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end

def os_x_change_defaults
  # defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
  # defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
end
