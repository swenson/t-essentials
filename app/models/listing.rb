class Listing < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  belongs_to :region
  belongs_to :contract
  
  validates_presence_of :category_id
  validates_presence_of :title
  
  def by
    whoby
  end
  
  def by=(someby)
    whoby=someby
  end
end
