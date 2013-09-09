########################
# INSTALL => suggestion: checkout a new branch before converting in bulk
# suggestion => change the view directories to match your APP
#
# Gemfile
# gem 'haml2erb'
# bundle
# ruby script/convert
########################

require 'rubygems'
require "bundler"
require 'fileutils'
ENV["BUNDLE_GEMFILE"] = File.expand_path("../../Gemfile", __FILE__)
Bundler.setup
require "haml2erb"

VIEW_DIRS = ["layouts", "articles", "comments", "pages", "projects", "sessions", "sites", "tags"]
  
def copy_haml_files_to_erb_files_and_convert_them
  VIEW_DIRS.each do |view_directory|
    Dir["app/views/#{view_directory}/*"].each do |filename|
      old_filename = filename
      new_filename = filename.gsub(/\.haml/, ".erb")
      FileUtils.rm(new_filename) if File.exists?(new_filename)
      if File.open(new_filename, "w"){|f| f.write(Haml2Erb.convert(File.read(old_filename))) }
        puts "converted #{old_filename} to #{new_filename}"
      end
    end
  end
end

def delete_haml_files
  VIEW_DIRS.each do |view_directory|
    Dir["app/views/#{view_directory}/*.html.haml"].each do |filename|
      if FileUtils.rm(filename)
        puts "deleted #{filename}"
      end
    end
  end
end

copy_haml_files_to_erb_files_and_convert_them
#delete_haml_files

# * manually verify your new converted files have content before deleting them
# * can re-run this after fixing parse issues. Parse issues usually a result of markup that could be simplified or ID/classes removed.
# * not perfect, have to do manual clean-ups
