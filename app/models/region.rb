class Region < ActiveRecord::Base
  has_many :listings
  has_many :contracts
  
  def to_s
    name
  end
  
end
