require 'test_helper'

class TestimonialTest < ActiveSupport::TestCase
  
  context "The Testimonial class itself" do
    should_validate_presence_of :name, :quote
    should_have_instance_methods :flash_name
  end

  context "A valid instance of a Testimonial" do
    setup do
      @t = Testimonial.new(:name => "Luke", :quote => "Lee says Hi")
    end

    should "return 'Quote by Luke' when calling flash_name" do
      assert_equal('Quote by Luke', @t.flash_name)
    end
  end

end
