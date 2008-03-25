class Client < ActiveRecord::Base
  has_many :transactions
  has_many :contracts
  
  validates_presence_of :business
  

  def name
    "#{lastname}, #{firstname} (#{business})"
  end

end
