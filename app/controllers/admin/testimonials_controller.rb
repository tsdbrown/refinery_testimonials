class Admin::TestimonialsController < Admin::BaseController

  crudify :testimonial, :title_attribute => :flash_name

end
