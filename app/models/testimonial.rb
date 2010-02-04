class Testimonial < ActiveRecord::Base

  acts_as_indexed :fields => [:quote, :name, :company, :job_title, :website],
          :index_file => [RAILS_ROOT,"tmp","index"]

  validates_presence_of :quote
  validates_presence_of :name

  def flash_name
    "Quote by #{self.name}"
  end

end
