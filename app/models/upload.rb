class Upload < ActiveRecord::Base
  belongs_to :contract
  
  has_attachment :storage => :s3,
                 :size => 1..(10.megabytes)

  validates_as_attachment
  
end
