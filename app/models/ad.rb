class Ad < ActiveRecord::Base
  belongs_to :contract
  belongs_to :adsize
end
