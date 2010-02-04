Refinery::Plugin.register do |plugin|
  plugin.title = "Testimonials"
  plugin.description = "Manage Testimonials"
  plugin.version = 1.0
  plugin.activity = {:class => Testimonial, :url_prefix => "edit_", :title => 'quote'}
end
