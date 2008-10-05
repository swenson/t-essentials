require 'erb'

class Subcategory < ActiveRecord::Base
  include WhiteListHelper
  belongs_to :category
  has_many :listings
  
  validates_presence_of :category_id
  
  def fullname
    "#{category.name} – #{name}"
  end
  
  def Subcategory.all_sorted
    find(:all).sort do |x,y| 
      if x.category.name == y.category.name
        x.name <=> y.name
      else
        x.category.name <=> y.category.name
      end
    end
  end
  
  def partial_description
    if description
      #ERB::Util::html_escape(description).split("\n")[0]
      white_list(description).split("\n")[0]
    end
  end
  
  def partial_description_esc_quote
    if partial_description
      partial_description.gsub('"', '\\"')
    else
      nil
    end
  end
  
  def format_text
    #ERB::Util::html_escape(description).gsub("\n", "<br />").gsub("\r", "")
    white_list(description).gsub("\n", "<br />").gsub("\r", "")
  end
  
  def format_text_esc_quote
    if format_text
      format_text.gsub('"', '\\"')
    else
      nil
    end
  end
end
