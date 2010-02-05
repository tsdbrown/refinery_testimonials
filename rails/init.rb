Refinery::Plugin.register do |plugin|
  plugin.title = "Testimonials"
  plugin.description = "Manage Testimonials"
  plugin.url = "/admin/#{plugin.title.downcase}"
  plugin.version = 1.0
  plugin.activity = {:class => Testimonial, :url_prefix => "edit_", :title => 'quote'}
end

require File.dirname(__FILE__) + '/../lib/refinery_testimonials'
