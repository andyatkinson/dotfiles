# Horribly broken
# Bugs:
# - If multiple versions of gems are installed, the output is counted, ideally the dependencies from the latest installed version are counter
# - Includes line counts that are not gem names
# - Doesn't intelligently exclude gems that are part of standard ruby
# - Matches for multiple gems that share a substring in their name, e.g. activeadmin and activeadmin_addons, and they should be distinct
#
# Please fix all the bugs! :P
#
# P.S. should probably take in a input of the gemfile path, and probably send the output to a file!
#
# Order and display Gemfile gems by number of dependencies (descending)
class GemfileProcessor
  GEM_NAME_REGEXP = /gem\s(\'|\")(\S*)(\'|\")/

  attr_accessor :gems

  def initialize
    @gems = []
  end

  def process_line(line)
    if line =~ GEM_NAME_REGEXP
      name = line.match(GEM_NAME_REGEXP).captures[1]
      deps = `gem dependency #{name} | wc -l`.strip.to_i - 1
      if deps > 1
        gems << {name: name, deps: deps}
      end
    end
  end

  def process
    File.open('Gemfile').each do |line|
      process_line(line)
    end

    gems.sort_by{ |g| g[:deps] }.reverse.each { |h| puts h[:deps].to_s.ljust(5) + h[:name].to_s }
  end
end

GemfileProcessor.new.process
