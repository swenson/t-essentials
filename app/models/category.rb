require 'erb'

class Category < ActiveRecord::Base
  include WhiteListHelper
  has_many :subcategories
  has_many :listings
  has_many :uploads

  validates_uniqueness_of :name
  
  def url
    "/main/show_category/#{id}"
  end

  def to_s
    name
  end
  
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
    if description
      #ERB::Util::html_escape(description).split("\n")[0]
      white_list(description).split("\n")[0]
    end
  end

  def partial_description_esc_quote
    partial_description.gsub('"', '\\"')
  end
    
  def format_text_esc_quote
    format_text.gsub('"', '\\"')
  end
  
  def format_text
    if description
      white_list(description).gsub("\n", "<br />").gsub("\r", "")
    else
      ''
    end
  end
  
  def format_long_description
    if long_description
      white_list(long_description).gsub("\n", "<br />").gsub("\r", "")
    else
      ''
    end
  end
end
