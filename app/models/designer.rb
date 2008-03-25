class Designer < ActiveRecord::Base
  has_many :contracts
  
  def name
    "#{firstname} #{lastname}"
  end
end
