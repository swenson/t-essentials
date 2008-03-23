class Adsize < ActiveRecord::Base
  has_many :transactions
  validates_presence_of :adsize
  validates_presence_of :numlistings
end
