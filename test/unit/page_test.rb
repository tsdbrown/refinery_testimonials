require 'test_helper'

class PageTest < ActiveSupport::TestCase
  
  context "The Page class has been extended and now it" do
    should_have_instance_methods :show_a_testimonial?
  end
  
end
