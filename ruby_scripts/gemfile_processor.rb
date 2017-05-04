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
