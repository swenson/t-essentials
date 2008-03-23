class Category < ActiveRecord::Base
  has_many :subcategories
  has_many :transactions
  has_many :listings
  
  def num_listings
    count = (Listing.find(:all, :conditions => "category_id = #{id}")).length
    if count
      return count
    else
      return 0
    end
  end
end
