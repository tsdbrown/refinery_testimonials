namespace :refinery_testimonials do
	desc "Install extra files from the refinery testimonial plugin"

	task :install do
		puts `ruby #{File.expand_path(File.dirname(__FILE__) << '/../..')}/bin/refinery_testimonial_install.rb #{RAILS_ROOT}`
	end
end