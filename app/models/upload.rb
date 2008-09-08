class Upload < ActiveRecord::Base
  belongs_to :contract
  
  has_attachment :storage => :file_system, 
                 :path_prefix => 'public/files',
                 :size => 1..(10.megabytes)

  validates_as_attachment
  
end
