class Page < ActiveRecord::Base
  # Works out whether this page should have a testimonial shown
  # based on the :show_testimonials_on_pages setting
  #
  # We assume nobody wants one displayed on the testimonials page
  def show_a_testimonial?
    return false if self.link_url == '/testimonials'
    show_on_pages = RefinerySetting.find_or_set(:show_testimonials_on_pages, 'none')
    show_on_pages =~ /all/i || show_on_pages.split(',').map {|t| t.strip.downcase}.include?(self.title.strip.downcase)
  end
end

ActionView::Base.send :include, TestimonialsHelper;