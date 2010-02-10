#!/usr/bin/env ruby
require 'fileutils'
REFINERY_TESTIMONIALS_ROOT = File.expand_path(File.dirname(__FILE__) << "/..")
RAILS_ROOT = ARGV.first unless defined? RAILS_ROOT
unless RAILS_ROOT.nil? or RAILS_ROOT.length == 0
  dirs = [['db', 'migrate'], ['public', 'stylesheets'], ['public', 'javascripts']]
  dirs.each do |dir|
    FileUtils::makedirs File.join(RAILS_ROOT, dir)
  end

  copies = [
    {:from => ["db", "migrate"],:to => ["db", "migrate"],:filename => "20100203164921_create_testimonials.rb"},
    {:from => ["public", "stylesheets"],:to => ["public", "stylesheets"],:filename => "testimonials.css"},
    {:from => ["public", "images"],:to => ["public", "images"],:filename => "close_quote.gif"},
    {:from => ["public", "images"],:to => ["public", "images"],:filename => "open_quote.gif"}
  ]
	copies.each do |copy|
    copy_from = File.join(REFINERY_TESTIMONIALS_ROOT, copy[:from], copy[:filename])
	  copy_to = File.join(RAILS_ROOT, copy[:to], copy[:filename])
    unless File.exists?(copy_to)
	    FileUtils::copy_file copy_from, copy_to
    else
      puts "'#{File.join copy[:to], copy[:filename]}' already existed in your application so your existing file was not overwritten."
    end
  end

	puts "---------"
	puts "Copied all refinery testimonials files."
	puts "Now, run rake db:migrate"
else
  puts "Please specify the path of the project that you want to use the refinery testimonials with, i.e. refinery_testimonials_install /path/to/project"
end