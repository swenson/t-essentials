class Client < ActiveRecord::Base
  has_many :contracts
  
  validates_presence_of :business
  
  def normalname
    "#{firstname} #{lastname} (#{business})"
  end
  
  def name
    "#{lastname}, #{firstname} (#{business})"
  end

end
