class Client < ActiveRecord::Base
  has_many :transactions
  
  validates_presence_of :business
  

  def name
    "#{business} (#{firstname} #{lastname})"
  end

end
