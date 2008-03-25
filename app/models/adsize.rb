class Adsize < ActiveRecord::Base
  has_many :transactions
  has_many :ads
  validates_presence_of :adsize
  validates_presence_of :numlistings
  
  def to_s
    "#{adsize} (web: #{numlistings})"
  end
end
