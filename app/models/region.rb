class Region < ActiveRecord::Base
  has_many :listings
  has_many :transactions
  
end
