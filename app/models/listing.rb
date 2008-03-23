class Listing < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  belongs_to :region
  
  validates_presence_of :category_id
  validates_presence_of :title
end
