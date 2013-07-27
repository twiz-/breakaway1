class Listing < ActiveRecord::Base
  attr_accessible :description, :video, :user_id
  
  belongs_to :user
  

end
