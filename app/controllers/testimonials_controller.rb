class TestimonialsController < ApplicationController

  before_filter :find_page

  def index
    @testimonials = Testimonial.paginate(:all, :order => "position ASC", :page => params[:page], :per_page => RefinerySetting.find_or_set(:testimonials_per_page, 10))
    present(@page)
  end

protected

  def find_page
    @page = Page.find_by_link_url("/testimonials")
  end

end