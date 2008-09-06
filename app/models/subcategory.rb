require 'erb'

class Subcategory < ActiveRecord::Base
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
    #ERB::Util::html_escape(description).split("\n")[0]
    description.split("\n")[0]
  end
  
  def partial_description_esc_quote
    if partial_description
      partial_description.gsub('"', '\\"')
    else
      ''
    end
  end
  
  def format_text
    #ERB::Util::html_escape(description).gsub("\n", "<br />").gsub("\r", "")
    description.gsub("\n", "<br />").gsub("\r", "")
  end
  
  def format_text_esc_quote
    if format_text
      format_text.gsub('"', '\\"')
    else
      ''
    end
  end
end
