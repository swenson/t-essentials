require 'erb'

class Category < ActiveRecord::Base
  has_many :subcategories
  has_many :listings
  
  def num_listings
    count = (Listing.find(:all, :conditions => "category_id = #{id}")).length
    if count
      return count
    else
      return 0
    end
  end
  
  def randomsubs
    subs = subcategories.sort_by { rand }[0..5]    
  end

  def partial_description
    #ERB::Util::html_escape(description).split("\n")[0]
    description.split("\n")[0]
  end
  
  def format_text
    #ERB::Util::html_escape(description).gsub("\n", "<br />").gsub("\r", "")
    description.gsub("\n", "<br />").gsub("\r", "")
  end  
end
