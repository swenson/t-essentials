class Adsize < ActiveRecord::Base
  has_many :ads
  validates_presence_of :adsize
  validates_presence_of :numlistings
  
  def price
    if standardprice
      sprintf('$%.2f', standardprice)
    else
      '$0.00'
    end
  end
    
  def to_s
    "#{adsize}, #{price}, web: #{numlistings}"
  end
end
