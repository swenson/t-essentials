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
end
