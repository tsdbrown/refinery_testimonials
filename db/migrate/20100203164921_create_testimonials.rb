class CreateTestimonials < ActiveRecord::Migration

  def self.up
    create_table :testimonials do |t|
      t.text :quote
      t.string :name
      t.string :company
      t.string :job_title
      t.string :website
      t.date :quoted_on
      t.integer :position

      t.timestamps
    end

    add_index :testimonials, :id

    User.find(:all).each do |user|
      user.plugins.create(:title => "Testimonials", :position => (user.plugins.maximum(:position) || -1) +1)
    end

    page = Page.create(
      :title => "Testimonials",
      :link_url => "/testimonials",
      :deletable => false,
      :position => ((Page.maximum(:position, :conditions => "parent_id IS NULL") || -1)+1),
      :menu_match => "^/testimonials(\/|\/.+?|)$"
    )
    RefinerySetting.find_or_set(:default_page_parts, ["body", "side_body"]).each do |default_page_part|
      page.parts.create(:title => default_page_part, :body => nil)
    end
  end

  def self.down
    UserPlugin.destroy_all({:title => "Testimonials"})

    Page.find_all_by_link_url("/testimonials").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/testimonials"})

    drop_table :testimonials
  end

end
