class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :listings
  
  validates_presence_of :category_id
  
  def fullname
    "#{category.name} – #{name}"
  end
end
