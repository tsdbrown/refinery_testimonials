module TestimonialsHelper

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

  def website_or_company(t)
    if t.website.blank?
      h(t.company)
    else
      content_tag(:a, h(t.company.blank? ? t.website : t.company), :href => h(t.website))
    end
  end
  
end
