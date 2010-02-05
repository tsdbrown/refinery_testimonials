module TestimonialsHelper

  # Helper method to be included in the page layout
  def display_page_testimonial_if_setup
    if @page.show_a_testimonial? && (random_testimonial = Testimonial.random)
      content_for :head, stylesheet_link_tag('testimonials')
      render :partial => '/testimonials/testimonial', :locals => {:testimonial => random_testimonial}
    end
  end

  # Based on the fields filled in by the user display the
  # citation in our desired format:
  #
  # Name: JobTitle, Company/Website (Company is a link to website if possible)
  def citation_line(t)
    [
      content_tag(:b, h(t.name)),
      h(t.job_title),
      website_or_company(t)
    ].reject(&:blank?).join(", ").sub(/,\s/, ": ")
  end

  # Method to setup the end of the citation line
  # Returns:
  # 
  # The company name as a link is both are set
  # The company name with a link
  # Or
  # Just a link if the name isn't set
  def website_or_company(t)
    if t.website.blank?
      h(t.company)
    else
      content_tag(:a, h(t.company.blank? ? t.website : t.company), :href => h(t.website))
    end
  end  
end
